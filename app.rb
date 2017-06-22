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
        airlines = CLIENT.request(:get, '/code-task/airlines').body
        date_specified = r['date']
        flights = []
        airlines.each do |a|
          path = "/code-task/flight_search/#{a['code']}?date=#{date_specified}&from=#{r['from']}&to=#{r['to']}"
          flights << CLIENT.request(:get, path)
        end
      end
    end
  end
end
