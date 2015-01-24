class Api::KindleNotesController < Api::BaseController

  def update
    kindle_note = KindleNote.find(params[:id])
    if kindle_note.update_attributes(permitted_params)
      render json: kindle_note, root: false, status: :ok
    else
      render json_errors_for(kindle_note)
    end
  end

  def destroy
    kindle_note = KindleNote.find(params[:id])
    if kindle_note.update_attributes(deleted_at: Time.now)
      render json: kindle_note, root: false, status: :ok
    else
      render json_errors_for(kindle_note)
    end
  end

  private

  def permitted_params
    params.require(:kindle_note).permit(:content)
  end
end
