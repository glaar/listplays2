class YoutubelistsController < ApplicationController
  # GET /youtubelists
  # GET /youtubelists.json
  def index
    @users = User.all
    @youtubelists = Youtubelist.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @youtubelists }
    end
  end

  def admin
    @youtubelists = Youtubelist.all
  end

  # GET /youtubelists/1
  # GET /youtubelists/1.json
  def show
    @youtubelist = Youtubelist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @youtubelist }
    end
  end

  # GET /youtubelists/new
  # GET /youtubelists/new.json
  def new
    @youtubelist = Youtubelist.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @youtubelist }
    end
  end

  # GET /youtubelists/1/edit
  def edit
    @youtubelist = Youtubelist.find(params[:id])
  end

  # POST /youtubelists
  # POST /youtubelists.json
  def create
    @youtubelist = current_user.youtubelists.build(youtubelist_params)

    respond_to do |format|
      if @youtubelist.save
        format.html { redirect_to current_user, notice: 'Youtubelist was successfully created.' }
        format.json { render json: @youtubelist, status: :created, location: @youtubelist }
      else
        format.html { render action: "new" }
        format.json { render json: @youtubelist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /youtubelists/1
  # PATCH/PUT /youtubelists/1.json
  def update
    @youtubelist = Youtubelist.find(params[:id])

    respond_to do |format|
      if @youtubelist.update_attributes(youtubelist_params)
        format.html { redirect_to @youtubelist, notice: 'Youtubelist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @youtubelist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /youtubelists/1
  # DELETE /youtubelists/1.json
  def delete
    @youtubelist = Youtubelist.find(params[:youtubelist_id])
    @youtubelist.destroy

    redirect_to current_user  


  end

  private

  # Use this method to whitelist the permissible parameters. Example:
  # params.require(:person).permit(:name, :age)
  # Also, you can specialize this method with per-user checking of permissible attributes.
  def youtubelist_params
    #gets the youtube video id
    video_id = params[:youtubelist]['url'][/v=([^&]+)/, 1]
    params[:youtubelist]['url'] = video_id

    params.require(:youtubelist).permit(:title, :url)
  end
end
