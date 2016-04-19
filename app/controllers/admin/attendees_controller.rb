class Admin::AttendeesController < Admin::BaseController

  has_scope :by_year, default: Year.order(year: :desc).first
  
  def checkin
    @attendee = Attendee.find(params[:id])
    @attendee.toggle!(:arrival_status)
    @attendees = apply_scopes(Attendee).by_year(Year.where(:reveal_decisions => true).order("year DESC").first.id).order(:id, :last_name, :first_name)
    if request.xhr?
      respond_to do |format|
        format.js 
      end
    end
  end
  
  def checklist
    @booths = Application.by_year(Year.where(:reveal_decisions => true).order("year DESC").first.id).booths.joins(:space).order('lower(spaces.business_name)')
    @stands = Application.by_year(Year.where(:reveal_decisions => true).order("year DESC").first.id).stands.joins(:space).order('lower(spaces.business_name)')
  end
  
  def import
  end
  
  def index
    @attendees = apply_scopes(Attendee).by_year(Year.where(:reveal_decisions => true).order("year DESC").first.id).order(:id, :last_name, :first_name)
    if params[:by_year]
      @year_scope = params[:by_year]
    end
    set_meta_tags title: 'Professional Preview attendee list'
  end
  
  def process_import
    @year = Year.find(params[:year_id])
    @imports = []
    # open CSV file
    # n = File.open(params[:csv_file].path, "w") {|f|
    #     f.write(File.open(params[:csv_file].path, "r:ISO-8859-1").read.encode(:universal_newline => true))
    # }
    # system("/bin/mv " + " /tmp/" + @import.csvfile_file_name + " " +  @import.csvfile.path)

    File.open(params[:csv_file].path, "r").readlines.each do |line|
      csv = CSV.parse(line)
      a = Attendee.new(year: @year, first_name: csv[0][0], last_name: csv[0][1], email: csv[0][2], organisation: csv[0][3], vip: csv[0][4])
      if a.save
        @imports << ['imported ', csv[0]]
      else
        @imports << ["error importing (#{a.errors.join(',')}) ", csv[0]]
      end
    end
  end
  
  def toggle_vip
    @attendee = Attendee.find(params[:id]) 
    if current_user.has_role? :god
      @attendee.toggle!(:vip)
    end
    if request.xhr?
      respond_to do |format|
        format.js
      end
    end
  end
  
end
