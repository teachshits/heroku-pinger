class WebsitesController < ApplicationController

  before_filter :signed_in_user, only: [:new, :create, :update, :destroy]
  before_filter :can_user_add_site?, only: :create

  # GET /websites
  # GET /websites.json
  def index
    @websites = Website.order("name ASC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @websites }
    end
  end

  # GET /websites/1
  # GET /websites/1.json
  def show
    @website = Website.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @website }
    end
  end

  # GET /websites/new
  # GET /websites/new.json
  def new
    @website = Website.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @website }
    end
  end

  # GET /websites/1/edit
  def edit
    @website = Website.find(params[:id])
  end

  # POST /websites
  # POST /websites.json
  def create

    url = params[:website][:url]
    name = params[:website][:name]
    summary = params[:website][:summary]
    # puts "---- current_user: #{current_user}"
    # puts "current_user.id in controller: #{current_user.id}"
    # logger.info session.inspect
    # puts "----------------"
    # puts "#{session.inspect}"
    # puts "----------------"
    user_id = current_user.id
    
    @website = Website.new
    @website.url = url
    @website.name = name
    @website.summary = summary
    @website.user_id = current_user.id
    @website.failed_tries = 0
    @website.successful_tries = 0
    @website.good_site = true

    respond_to do |format|
      if current_user.number_of_sites < 5 &&  @website.save
        current_user.number_of_sites += 1
        current_user.save
        # puts "user.number_of_sites in controller: #{current_user.number_of_sites}"
        # puts "user.id in controller: #{current_user.id}"
        # puts "user.name in controller: #{current_user.name}"
        format.html { redirect_to @website, notice: 'Website was successfully created.' }
        format.json { render json: @website, status: :created, location: @website }
      else
        format.html { render action: "new" }
        format.json { render json: @website.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /websites/1
  # PUT /websites/1.json
  def update
    @website = Website.find(params[:id])

    respond_to do |format|
      if @website.update_attributes(params[:website])
        format.html { redirect_to @website, notice: 'Website was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @website.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /websites/1
  # DELETE /websites/1.json
  def destroy
    @website = Website.find(params[:id])
    user_id = current_user.id
    # puts "trying to delete: @website.user_id: #{@website.user_id} current_user.id: #{current_user.id}"
    respond_to do |format|
      if @website.user_id != current_user.id
        # puts "trying to delete with wrong id: @website.user_id: #{@website.user_id} current_user.id: #{current_user.id}"
        format.html { redirect_to websites_url , notice: 'Website entry owned by different user.' }
        format.json { render json: @website.errors, status: :unprocessable_entity }
      elsif @website.destroy
        
        current_user.number_of_sites -= 1
        current_user.save
        format.html { redirect_to websites_url , notice: 'Website was successfully deleted.' }
        format.json { head :no_content }
      end
    end
  end

private 
  def signed_in_user
    redirect_to root_path unless user_signed_in? 
  end

    

end
