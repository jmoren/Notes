class Admin::NotasController < AdminController
  before_filter :find_nota, :only => [:show, :edit, :update, :destroy]

  def index
    @notas = Nota.all
  end

  def show

  end

  def edit

  end

  def update
    if @nota.update_attributes(params[:nota])
      redirect_to admin_notas_path, :notice => 'Note was updated!'
    else
      render 'edit'
    end
  end

  def destroy
    @nota.destroy
    redirect_to admin_notas_path, :notice => 'The note was deleted!'
  end

  private

  def find_nota
    @nota = Nota.find(params[:id])
  end
end

