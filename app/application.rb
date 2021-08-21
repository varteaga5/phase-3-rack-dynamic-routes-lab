class Application


    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)
  
    if req.path =="/testing"
        resp.write "Route not found"
        resp.status = 404
    
    elsif req.path.match(/items/)
        item = req.path.split("/").last
        find_item = @@items.find{|itm| itm.name == item}
        if find_item
            resp.status = 200
            resp.write "#{find_item.price}"
        
      else
        resp.write "Item not found"
        resp.status = 400
      end

    end
  
      resp.finish
    end
  end 