class ServiceController < ApplicationController
  
  def read_file file_name
    file = File.open("public/" + file_name, "r")
    data = file.read
    file.close
    data
  end
 
  def output response
    respond_to do |format|
      format.json { render json: Hash.from_xml(response.gsub(/\n+/, "").gsub(/\s+/, "")).to_json, :content_type => 'application/json' }
      format.xml { render xml: response, :content_type => 'text/xml' }
      format.yaml { render :text => Hash.from_xml(response.gsub(/\n+/, "").gsub(/\s+/, "")).to_yaml, :content_type => 'text/yaml'}
    end
  end
 
  def show_all
    if (not request.query_string.empty?) and (not request.query_string.gsub(/content=/, "").eql?(request.query_string))
      if request.query_string.gsub(/content=/, "").eql?("publicaciones")
        output read_file "publicaciones.xml"
      elsif request.query_string.gsub(/content=/, "").eql?("eventos")
        output read_file "eventos.xml"
      end
    end
  end

  def show_category
    if (not request.query_string.empty?) and (not request.query_string.gsub(/hashtag=/, "").eql?(request.query_string))
      hashtag = request.query_string.gsub(/hashtag=/, "")
      
    end
  end

  def show_time
  end

  def show_event_post
  end
end
