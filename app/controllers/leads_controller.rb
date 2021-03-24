include SendGrid
require 'sendgrid-ruby'
require 'json'

class LeadsController < ApplicationController
        
    # POST /quotes or /quotes.json
    def create
        
        @lead = Lead.new(lead_params)
        
     #===================================================================================================
     # DECLARING VARIABLES  
     #===================================================================================================
        attachment = params["attachment"]
        #@lead.file_name = attachment
     
     #===================================================================================================
     # SAVER  
     #===================================================================================================
        @lead.save

     #===================================================================================================
     # PRINTS PARAMS INTO TERMINAL WINDOW
     #===================================================================================================
        puts "===========START================"
        puts params
        puts "=============END================"

     #===================================================================================================
     # FORM SUBMISSION & FILE ATTACHMENT LOGIC (converts into binary code, submission alert, redirecting, rendering, errors) 
     #===================================================================================================
        if attachment != nil
            @lead.attachment = attachment.read
            @lead.file_name = attachment.original_filename
        end  
        
        if @lead.save!
            redirect_back fallback_location: root_path, notice: "Your Request was successfully created and sent!"
            sendgrid()
            zendesk_lead_ticket()
        end    
    end 

    require 'zendesk_api'

    def zendesk_lead_ticket
        client = ZendeskAPI::Client.new do |config|
            config.url = ENV['ZENDESK_URL']
            config.username = ENV['ZENDESK_USERNAME']
            config.token = ENV['ZENDESK_TOKEN']
        end
        ZendeskAPI::Ticket.create!(client, 
        :subject => "#{@lead.full_name_of_contact} from #{@lead.company_name}",
        :comment => {
            :value => 
            "The contact #{@lead.full_name_of_contact} from #{@lead.company_name} can be reached at #{@lead.email} and at phone number #{@lead.phone}
            #{@lead.department_in_charge_of_elevators} has a project named #{@lead.project_name} which would require contribution from Rocket Elevators.
            
            Projet Description : #{@lead.project_description}

            Attached message : #{@lead.message}.  
            
            The Contact uploaded an attachment"
        },
        
        :requester => {
            "name": @lead.full_name_of_contact,
            # "email": @lead.email
        },
        :priority => "normal",
        :type => "question"
        )
    end

    def sendgrid
        mail = SendGrid::Mail.new
        mail.from = SendGrid::Email.new(email: 'rocket_elevator12345@outlook.com')
        mail.subject = "Welcome to Rocket Elevators"
        personalization = Personalization.new
        personalization.add_to(Email.new(email: lead_params[:email]))
        mail.add_personalization(personalization)
        #
        #HTML CODE FOR THE EMAIL 
        #
        mail.add_content(Content.new(type: 'text/html',
             value: "<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Strict//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd'>
              <html data-editor-version='2' class='sg-campaigns' xmlns='http://www.w3.org/1999/xhtml'>
                <head>
                  <meta http-equiv='Content-Type' content='text/html; charset=utf-8' />
                  <meta name='viewport' content='width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1' /><!--[if !mso]><!-->
                  <meta http-equiv='X-UA-Compatible' content='IE=Edge' /><!--<![endif]-->
                  <!--[if (gte mso 9)|(IE)]>
                  <xml>
                  <o:OfficeDocumentSettings>
                  <o:AllowPNG/>
                  <o:PixelsPerInch>96</o:PixelsPerInch>
                  </o:OfficeDocumentSettings>
                  </xml>
                  <![endif]-->
                  <!--[if (gte mso 9)|(IE)]>
                  <style type='text/css'>
                    body {width: 600px;margin: 0 auto;}
                    table {border-collapse: collapse;}
                    table, td {mso-table-lspace: 0pt;mso-table-rspace: 0pt;}
                    img {-ms-interpolation-mode: bicubic;}
                  </style>
                  <![endif]-->
              
                  <style type='text/css'>
                    body, p, div {
                      font-family: arial,helvetica,sans-serif;
                      font-size: 14px;
                    }
                    body {
                      color: #000000;
                    }
                    body a {
                      color: #1188E6;
                      text-decoration: none;
                    }
                    p { margin: 0; padding: 0; }
                    table.wrapper {
                      width:100% !important;
                      table-layout: fixed;
                      -webkit-font-smoothing: antialiased;
                      -webkit-text-size-adjust: 100%;
                      -moz-text-size-adjust: 100%;
                      -ms-text-size-adjust: 100%;
                    }
                    img.max-width {
                      max-width: 100% !important;
                    }
                    .column.of-2 {
                      width: 50%;
                    }
                    .column.of-3 {
                      width: 33.333%;
                    }
                    .column.of-4 {
                      width: 25%;
                    }
                    @media screen and (max-width:480px) {
                      .preheader .rightColumnContent,
                      .footer .rightColumnContent {
                          text-align: left !important;
                      }
                      .preheader .rightColumnContent div,
                      .preheader .rightColumnContent span,
                      .footer .rightColumnContent div,
                      .footer .rightColumnContent span {
                        text-align: left !important;
                      }
                      .preheader .rightColumnContent,
                      .preheader .leftColumnContent {
                        font-size: 80% !important;
                        padding: 5px 0;
                      }
                      table.wrapper-mobile {
                        width: 100% !important;
                        table-layout: fixed;
                      }
                      img.max-width {
                        height: auto !important;
                        max-width: 480px !important;
                      }
                      a.bulletproof-button {
                        display: block !important;
                        width: auto !important;
                        font-size: 80%;
                        padding-left: 0 !important;
                        padding-right: 0 !important;
                      }
                      .columns {
                        width: 100% !important;
                      }
                      .column {
                        display: block !important;
                        width: 100% !important;
                        padding-left: 0 !important;
                        padding-right: 0 !important;
                        margin-left: 0 !important;
                        margin-right: 0 !important;
                      }
                    }
                  </style>
                  <!--user entered Head Start-->
                  
                  <!--End Head user entered-->
                </head>
                <body>
                  <center class='wrapper' data-link-color='#1188E6' data-body-style='font-size: 14px; font-family: arial,helvetica,sans-serif; color: #000000; background-color: #ffffff;'>
                    <div class='webkit'>
                      <table cellpadding='0' cellspacing='0' border='0' width='100%' class='wrapper' bgcolor='#ffffff'>
                        <tr>
                          <td valign='top' bgcolor='#ffffff' width='100%'>
                            <table width='100%' role='content-container' class='outer' align='center' cellpadding='0' cellspacing='0' border='0'>
                              <tr>
                                <td width='100%'>
                                  <table width='100%' cellpadding='0' cellspacing='0' border='0'>
                                    <tr>
                                      <td>
                                        <!--[if mso]>
                                        <center>
                                        <table><tr><td width='600'>
                                        <![endif]-->
                                        <table width='100%' cellpadding='0' cellspacing='0' border='0' style='width: 100%; max-width:600px;' align='center'>
                                          <tr>
                                            <td role='modules-container' style='padding: 0px 0px 0px 0px; color: #000000; text-align: left;' bgcolor='#ffffff' width='100%' align='left'>
                                              
                  <table class='module preheader preheader-hide' role='module' data-type='preheader' border='0' cellpadding='0' cellspacing='0' width='100%'
                        style='display: none !important; mso-hide: all; visibility: hidden; opacity: 0; color: transparent; height: 0; width: 0;'>
                    <tr>
                      <td role='module-content'>
                        
                      </td>
                    </tr>
                  </table>
                
                  <table class='module' role='module' data-type='text' border='0' cellpadding='0' cellspacing='0' width='100%' style='table-layout: fixed;'>
                    <tr>
                      <td style='padding:18px 0px 18px 0px;line-height:22px;text-align:inherit;'
                          height='100%'
                          valign='top'
                          bgcolor=''>
                          <div>
                <div style='font-family: inherit; text-align: inherit'><strong>Greetings #{lead_params[:full_name_of_contact].capitalize}</strong></div>
                
                <div style='font-family: inherit; text-align: inherit'><br>
                We thank you for contacting Rocket Elevators to discuss the opportunity to contribute to your project #{lead_params[:project_name].capitalize}.</div>
                
                <div style='font-family: inherit; text-align: inherit'><br>
                A representative from our team will be in touch with you very soon. We look forward to demonstrating the value of our solutions and helping you choose the appropriate product given your requirements.</div>
                
                <div style='font-family: inherit; text-align: inherit'><br>
                We’ll Talk soon</div>
                
                <div style='font-family: inherit; text-align: inherit'>&nbsp;</div>
                
                <div style='font-family: inherit; text-align: inherit'><strong>The Rocket Team</strong></div>
                <p>
                  <span class='block'><i class='fa fa-map-marker'></i> Address: 418-725 Boulevard Lebourgneuf, Québec, QC, G2J 0C4, Canada</span></br>
                  <span class='block'><i class='fa fa-phone'></i> Phone: <a href='tel:(418)555-1234'>(418) 555-1234</a></span></br>
                  <span class='block'><i class='fa fa-envelope'></i> Email: <a href='mailto:info@codeboxx.biz'>info@codeboxx.biz</a></span></br>
                </p>
                </div>
                      </td>
                    </tr>
                  </table>
                
                  <table class='wrapper' role='module' data-type='image' border='0' cellpadding='0' cellspacing='0' width='100%' style='table-layout: fixed;'>
                    <tr>
                      <td style='font-size:6px;line-height:10px;padding:0px 0px 0px 0px;' valign='top' align='left'>
                        <img class='max-width' border='0' style='display:block;color:#000000;text-decoration:none;font-family:Helvetica, arial, sans-serif;font-size:16px;' src='https://marketing-image-production.s3.amazonaws.com/uploads/2185e496f9f7fd329704aa2b54bb574279486c4a2e8df75e768e3a39941b8cf24c531fdc40615bb0880ec63e1c744f12618d3d850c2d0b5d3f2e023496f3d0f3.png' alt='' width='300' height='' data-proportionally-constrained='true' data-responsive='false'>
                      </td>
                    </tr>
                  </table>
      
                                            </td>
                                          </tr>
                                        </table>
                                        <!--[if mso]>
                                        </td></tr></table>
                                        </center>
                                        <![endif]-->
                                      </td>
                                    </tr>
                                  </table>
                                </td>
                              </tr>
                            </table>
                          </td>
                        </tr>
                      </table>
                    </div>
                  </center>
                </body>
              </html>"))
        # mail = SendGrid::Mail.new(from, subject, to, content)

        sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
        response = sg.client.mail._('send').post(request_body: mail.to_json)
        puts response.status_code
        puts response.body
        puts response.headers
    end   
     #===================================================================================================
     # DEFINING @lead = Lead.new(lead_params) BELOW:
     #===================================================================================================

     # Only allow a list of trusted parameters through.
    def lead_params
        params.required(:leads).permit!
    end
end