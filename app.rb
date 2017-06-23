class App < Roda
  route do |r|
    # GET /
    r.root do
      'Flight search backend'
    end

    # GET /airlines
    r.on 'airlines' do
      r.get do
        CLIENT.request(:get, '/code-task/airlines').body
      end
    end

    # GET /airports?q=Melbourne
    r.on 'airports' do
      r.get do
        CLIENT.request(:get, "/code-task/airports/?q=#{r['q']}").body
      end
    end

    # GET /search?from=Melbourne&to=Sydney&date=2018-09-02
    r.on 'search' do
      r.get do
        from = JSON.parse(CLIENT.request(:get, "/code-task/airports/?q=#{r['from']}").body)
        to = JSON.parse(CLIENT.request(:get, "/code-task/airports/?q=#{r['to']}").body)
        airlines = JSON.parse(CLIENT.request(:get, '/code-task/airlines').body)
        departure = Date.parse(r['date'])
        flights = []
        ((departure - 2)..(departure + 2)).each do |d|
          from.each do |f|
            to.each do |t|
              airlines.each do |a|
                path = "/code-task/flight_search/#{a['code']}?date=#{d.to_s}&from=#{f['airportCode']}&to=#{t['airportCode']}"
                flights |= JSON.parse(CLIENT.request(:get, path).body)
              end
            end
          end
        end
        flights.to_json
      end
    end
  end
end
