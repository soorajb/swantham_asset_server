require 'sinatra'

class SwanthamAssetServer < Sinatra::Base
  get '/' do
    '-Swantham-'
  end

  post '/asset_upload' do
    FileUtils.mkdir_p("#{File.dirname(__FILE__)}/#{File.dirname(params['typ']).to_s}")
    File.open("#{File.dirname(__FILE__)}/#{params['typ']}", "w") do |f|
    f.write(params['myfile'][:tempfile].read)
    end
  return "OK"
  end
  
  post '/asset_delete' do
     f = URI.parse(params[:f])
     File.delete("#{File.dirname(__FILE__)}/#{f.request_uri}") if File.exists?("#{File.dirname(__FILE__)}/#{f.request_uri}")
    return "DONE"
  end

end
