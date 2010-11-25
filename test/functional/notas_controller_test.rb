require 'test_helper'

class NotasControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Nota.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Nota.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Nota.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to nota_url(assigns(:nota))
  end
  
  def test_edit
    get :edit, :id => Nota.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Nota.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Nota.first
    assert_template 'edit'
  end

  def test_update_valid
    Nota.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Nota.first
    assert_redirected_to nota_url(assigns(:nota))
  end
  
  def test_destroy
    nota = Nota.first
    delete :destroy, :id => nota
    assert_redirected_to notas_url
    assert !Nota.exists?(nota.id)
  end
end
