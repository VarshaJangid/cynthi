<?php
class Product extends CI_controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('admin/productmodel');
        $this->load->model('admin/joindealmodel');
    }

    public function index()
    {
        $data['country']=$this->joindealmodel->fetch_country();
        $data['product_details']=$this->productmodel->fetch_profuctssss();
        $this->load->view('frontend/template/header');
      //  $this->load->view('frontend/template/navbar');

        $this->load->view('frontend/product',$data);
        $this->load->view('frontend/template/footer');
    }
}
