namespace :utils do
  task (:generate_google_sitemap => :environment) do
    include ActionController::UrlWriter  
    default_url_options[:host] = 'go-redbird-go.com'  

    filename = "#{RAILS_ROOT}/public/sitemap.xml"  
    File.open(filename, "w") do |file|  
      xml = Builder::XmlMarkup.new(:target => file, :indent => 2)  
      xml.instruct!  
      xml.urlset "xmlns" => "http://www.sitemaps.org/schemas/sitemap/0.9" do  
        xml.url do
          xml.loc home_url
          xml.lastmod Page.named('Home').updated_at.xmlschema
          xml.changefreq "weekly"
          xml.priority 0.8
        end
        xml.url do
          xml.loc projects_url
          xml.lastmod Project.maximum(:updated_at).xmlschema
          xml.changefreq "weekly"
          xml.priority 1.0
        end
        xml.url do
          xml.loc about_url
          xml.lastmod Page.named('About').updated_at.xmlschema
          xml.changefreq "weekly"
          xml.priority 0.9
        end
      end  
    end    
  end
end