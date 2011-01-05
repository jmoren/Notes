class Admin::NotasController < AdminController
  before_filter :find_nota, :only => [:show, :destroy]
  def index
    @notas = Nota.all
  end

  def show

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

