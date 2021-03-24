class Customer < ApplicationRecord   
    belongs_to :user
    belongs_to :address
    has_many :buildings
    has_many :leads, dependent: :destroy

    after_create :send_attachment_to_dropbox
    after_update :send_attachment_to_dropbox



    def send_attachment_to_dropbox
        puts self.id
        dropbox_client = DropboxApi::Client.new(ENV['DROPBOX_TOKEN'])

        puts self.email_of_company_contact
        Lead.where(email: self.email_of_company_contact).each do |lead|
            unless lead.attachment.nil?
                puts "This model has attachment"
                dir_path = "/" + self.company_name
                begin
                    dropbox_client.create_folder dir_path
                rescue DropboxApi::Errors::FolderConflictError => err
                    puts "Folder already exists. Continue to upload files."
                end
                begin
                    dropbox_client.upload(dir_path + "/" + lead.file_name, lead.attachment)
                rescue DropboxApi::Errors::FileConflictError => err
                    puts "File already exists. Continue to delete file from database."
                end


                lead.attachment = nil;
                lead.save!
            end
        end
    end            
end         
