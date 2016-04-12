class LocationsController < ApplicationController
    # GET /locations/new
    def new_location
    end
    
    # POST /locations/create
    def create_location

        @location = Location.new(
            name: params[:name],
            description: params[:description],
            coordinates: params[:coordinates],
            tag: (('A'..'Z').to_a + ('a'..'z').to_a + (0..9).to_a).shuffle[0..7].join
        )
        
        if @location.save
            redirect_to show_location_path(@location)
        else
            redirect_to root_path
        end
    end
    
    # GET /locations
    def show_all_locations
        @locations = Location.all
        @qr = RQRCode::QRCode.new("#{root_url}#{@location.tag}", size: 8)
    end
    
    # GET /locations/:id
    def show_location
        @location = Location.find(params[:id])
    end
    
    # GET /locations/:id/edit
    def edit_location
        @location = Location.find(params[:id])
    end
    
    # POST /locations/:id/update
    def update_location
        @location = Location.find(params[:id])
        
        if @location.update(
                name: params[:location][:name],
                description: params[:location][:description],
                coordinates: params[:location][:coordinates]
            )
            redirect_to show_location_path(@location)
        else
            redirect_to root_path
        end
    end
    
    # DELETE /locations/:id
    def delete_location
        @location = Location.find(params[:id])
        
        if @location.destroy
            redirect_to show_all_locations_path
        else
            redirect_to show_location_path(@location)
        end
    end
end