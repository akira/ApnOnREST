class NotificationsController < ApplicationController
  # GET /notifications
  # GET /notifications.xml
  def index
    @notifications = APN::Notification.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @notifications }
    end
  end

  # GET /notifications/1
  # GET /notifications/1.xml
  def show
    @notification = APN::Notification.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @notification }
    end
  end

  # GET /notifications/new
  # GET /notifications/new.xml
  def new
    @notification = APN::Notification.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @notification }
    end
  end

  # GET /notifications/1/edit
  def edit
    @notification = APN::Notification.find(params[:id])
  end

  # POST /notifications
  # POST /notifications.xml
  def create
    @notification = APN::Notification.new(params[:notification])
    set_custom_properties
    respond_to do |format|
      if @notification.save
        format.html { redirect_to(notification_url(@notification), :notice => 'Notification was successfully created.') }
        format.xml  { render :xml => @notification, :status => :created, :location => @notification }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @notification.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /notifications/1
  # PUT /notifications/1.xml
  def update
    @notification = APN::Notification.find(params[:id])
    set_custom_properties
    respond_to do |format|
      if @notification.update_attributes(params[:notification])
        format.html { redirect_to(notification_url(@notification), :notice => 'Notification was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @notification.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /notifications/1
  # DELETE /notifications/1.xml
  def destroy
    @notification = APN::Notification.find(params[:id])
    @notification.destroy

    respond_to do |format|
      format.html { redirect_to(notifications_url) }
      format.xml  { head :ok }
    end
  end
  
  protected
  def set_custom_properties
    if(!params[:notification][:custom_properties].blank?)
      if(!params[:notification][:custom_properties].include?("--- !map:ActiveSupport::HashWithIndifferentAccess"))
        params[:notification][:custom_properties] = JSON.parse(params[:notification][:custom_properties])
      end
    else
      params[:notification][:custom_properties] = nil
    end      
  end
end
