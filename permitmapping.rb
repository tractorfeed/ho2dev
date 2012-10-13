	get '/' do
		erb :index
	end

	get '/api' do
		redirect '/'
	end

	get '/api/permits' do
		redirect '/'
	end

	get '/api/permits/query' do
		start_date = params.delete('start_date')
		end_date = params.delete('end_date')
		permit_type = params.delete('permit_type')
		permit_status = params.delete('permit_status')
		neighborhood = params.delete('neighborhood')
		lat = params.delete('lat')
		lng = params.delete('lng')
		radius = params.delete('radius')
		limit = params.delete('limit') || 100

		limit = [100, limit].min
		limit = [1,   limit].max
		conditions = Hash.new

		if(permit_status)
			permit_status = PermitStatus.first(permit_status)
			if(permit_status)
				conditions[:permit_status] = permit_status
			end
		end
		if(permit_type)
			permit_type = PermitType.first(permit_type)
			if(permit_type)
				conditions[:permit_type] = permit_type
			end
		end
		if(start_date)
			begin
				start_date = Date.strptime(start_date, "%m/%d/%Y")
			rescue
				start_date = nil
			end
			if(start_date)
				conditions[:date.gte] = start_date
			end
		end
		if(end_date)
			begin
				end_date = Date.strptime(end_date, "%m/%d/%Y")
			rescue
				end_date = nil
			end
			if(end_date)
				conditions[:date.lte] = end_date
			end
		end
		if(neighborhood)
			neighborhood = Neighborhood.first(neighborhood)
			if(neighborhood)
				conditions[:neighborhood] = neighborhood
			end
		end
		if(lat && lng && radius)
			bbox = get_bounding_box(lat, lng, radius)
			conditions[:latitude.gte]  = bbox['min_lat']
			conditions[:longitude.gte] = bbox['min_lng']
			conditions[:latitude.lte]  = bbox['max_lat']
			conditions[:longitude.lte] = bbox['max_lng']
		end
		if(conditions.keys.count > 0)
			permits = Permit.all(:conditions => conditions, :limit => limit)
		else
			permits = Permit.all(:limit => limit)
		end
		return permits.to_json
	end

	get '/api/permits/summary' do

	end

	get '/api/permits/summary/:neighborhood_id' do

	end

	get '/api/neighborhoods' do
		return Neighborhood.all.to_json
	end

	get '/api/permits/types' do
		return PermitType.all.to_json
	end

	get '/api/permits/statuses' do
		return PermitStatus.all.to_json
	end
