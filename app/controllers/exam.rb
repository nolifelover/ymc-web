Ymc::App.controllers :exam do
  
  # get :index, :map => '/foo/bar' do
  #   session[:foo] = 'bar'
  #   render 'index'
  # end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   'Maps to url '/foo/#{params[:id]}''
  # end

  # get '/example' do
  #   'Hello world!'
  # end
  get :index, :map => "/" do
    render 'exam/index.html.erb'
  end

  post :search, :map => "/seat/search" do
    code = params[:code]
    firstname = params[:firstname]
    lastname = params[:lastname]
    school = params[:school]
    @exam_rooms = ExamRoom.where("code like ? and firstname like ? and lastname like ? and school like ?","%#{code}%", "#{firstname}%", "#{lastname}%", "#{school}%").all()
    render 'exam/search.erb', :layout => false
  end

  get :print, :with => :id, :map => "/seat/print" do
    begin
      @exam = ExamRoom.find(params[:id])
      render 'exam/print.erb', :layout => false
    rescue
      redirect "/"
    end
  end

  get :result, :with => :id, :map => "/seat/result" do
    begin
      @exam = ExamRoom.find(params[:id])
      render 'exam/result.erb', :layout => false
    rescue
      redirect "/"
    end
  end

  get :upload, :map => "/exam/result/uploads" do
    if params[:admin] == "admin"
      render 'exam/upload.html.erb'
    else
      redirect "/"
    end
  end

  post :process, :map => "/exam/result/process" do
    tempfile = params[:file][:tempfile] 
    filename = params[:file][:filename]
    level = params[:level]
    f = File.open(tempfile, "r")
    f.each_line do |line|
      fields = line.split(',')
      code = fields[0]
      exam = ExamRoom.where("code=? and level=?", code, level).first()
      if exam
        exam.no_single = fields[1]
        exam.score_single = fields[2]
        exam.score_team = fields[3]
        exam.no_team = fields[4]
        exam.save
      end
    end
    redirect "/"
  end
end
