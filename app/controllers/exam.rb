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
end
