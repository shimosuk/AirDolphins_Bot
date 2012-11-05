# encoding: utf-8
class SchedulesController < ApplicationController
  # GET /schedules
  # GET /schedules.json
  def index
    @schedules = Schedule.order("date")

    rubytter = OAuthRubytter.new(self.class.token)
    @timeline = rubytter.user_timeline("781825164", {"count" => 10})

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @schedules }
    end
  end

  def tweet

    date = params[:date]
    site = params[:location]
    rubytter = OAuthRubytter.new(self.class.token)
    rubytter.update("日時: #{date} \n場所: #{site} #練習日\n(#{Time.now.strftime("at %H:%M:%S") })")

    redirect_to :schedules
  end

  # GET /schedules/1
  # GET /schedules/1.json
  def show
    @schedule = Schedule.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @schedule }
    end
  end

  # GET /schedules/new
  # GET /schedules/new.json
  def new
    @schedule = Schedule.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @schedule }
    end
  end

  # GET /schedules/1/edit
  def edit
    @schedule = Schedule.edit(params[:id])
  end

  # POST /schedules
  # POST /schedules.json
  def create
    @schedule = Schedule.create(format(params))

    respond_to do |format|
      if @schedule.save
        format.html { redirect_to @schedule, notice: 'Schedule was successfully created.' }
        format.json { render json: @schedule, status: :created, location: @schedule }
      else
        format.html { render action: "new" }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  def format(param)
    week = ["日", "月", "火", "水", "木", "金", "土"]

    schedule = params[:schedule]
    day = Date::new(schedule["date(1i)"].to_i, schedule["date(2i)"].to_i, schedule["date(3i)"].to_i)
    time = "#{params[:schedule]["date(4i)"]}:#{params[:schedule]["date(5i)"]}"
    date = "#{day.to_s}(#{week[day.wday]}) #{time}"

    pram = {date: date, location: schedule[:location], action: schedule[:action]}
  end

  # PUT /schedules/1
  # PUT /schedules/1.json
  def update
    @schedule = Schedule.find(params[:id])

    respond_to do |format|
      if @schedule.update_attributes(params[:schedule])
        format.html { redirect_to @schedule, notice: 'Schedule was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.json
  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy

    respond_to do |format|
      format.html { redirect_to schedules_url }
      format.json { head :no_content }
    end
  end
end
