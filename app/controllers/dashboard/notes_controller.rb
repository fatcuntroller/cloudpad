class Dashboard::NotesController < DashboardController
  def index
    @note = Note.last
  end
  
  def show
    @note = Note.find(params[:id])
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
    @note = Note.find(params[:id])
  end
  
  def update
    @note = Note.find(params[:id])
    @note.update(note_params)
    redirect_to dashboard_note_path(@note)
  end
  
  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to dashboard_notes_path
  end
  
  private
  
    def note_params
      params.require(:note).permit(:name, :content, :user_id)
    end
end
