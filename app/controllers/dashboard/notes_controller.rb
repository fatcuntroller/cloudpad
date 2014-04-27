class Dashboard::NotesController < DashboardController
  def index
    @note = Note.last
  end
  
  def show
    if(user_permission)
    #@note = Note.find(params[:id])
  end
  
  def new
    @note = Note.new
  end
  
  def create
    @note = @user.notes.build(note_params)
    @note.save
    redirect_to dashboard_note_path(@note)
  end
  
  def edit
    if(user_permission)
  end
  
  def update
    #@note = Note.find(params[:id])
    if(user_permissions)
      @note.update(note_params)
      redirect_to dashboard_note_path(@note)
    end
  end
  
  def destroy
    #@note = Note.find(params[:id])
    if(user_permissions)
      @note.destroy
      redirect_to dashboard_notes_path
    end
  end
  
  private
    def user_permissions
      @note = Note.find(params[:id])
      if(@note.user_id != session[:user_id])
        redirect_to dashboard_notes_path
        return true;
      else
        return false;
      end
    end
    def note_params
      params.require(:note).permit(:name, :content, :user_id)
    end
end
