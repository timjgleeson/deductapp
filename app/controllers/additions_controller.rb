class AdditionsController < ApplicationController
  # GET /additions
  # GET /additions.json
  def index
    @additions = Addition.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @additions }
    end
  end

  # GET /additions/1
  # GET /additions/1.json
  def show
    @addition = Addition.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @addition }
    end
  end

  # GET /additions/new
  # GET /additions/new.json
  def new
    @addition = Addition.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @addition }
    end
  end

  # GET /additions/1/edit
  def edit
    @addition = Addition.find(params[:id])
  end

  # POST /additions
  # POST /additions.json
  def create
    @addition = Addition.new(params[:addition])
    @addition.user_id = current_user.id

    respond_to do |format|
      if @addition.save
        format.html { redirect_to @addition, notice: 'Addition was successfully created.' }
        format.json { render json: @addition, status: :created, location: @addition }
      else
        format.html { render action: "new" }
        format.json { render json: @addition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /additions/1
  # PUT /additions/1.json
  def update
    @addition = Addition.find(params[:id])

    respond_to do |format|
      if @addition.update_attributes(params[:addition])
        format.html { redirect_to @addition, notice: 'Addition was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @addition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /additions/1
  # DELETE /additions/1.json
  def destroy
    @addition = Addition.find(params[:id])
    @addition.destroy

    respond_to do |format|
      format.html { redirect_to additions_url }
      format.json { head :no_content }
    end
  end
end
