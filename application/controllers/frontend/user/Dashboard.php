<?php
class Dashboard extends CI_controller
{
    public function __construct()
    {
        parent::__construct();
        if(!isset($_SESSION['email'])){
            redirect(base_url().'signin');
        }

    }
    public function index()
    {
        
       
      

        $this->load->view('frontend/template/header');
       // $this->load->view('frontend/template/navbar');
        $this->load->view('frontend/user/dashboard');
        //$this->load->view('frontend/template/footer');
    }
}
