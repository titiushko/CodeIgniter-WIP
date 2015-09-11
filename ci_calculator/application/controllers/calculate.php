<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/*
 * Calculation of controller, the class name the first letter should be capitalized, all controllers must inherit from the CI_Controller class
 */
class Calculate extends CI_Controller {
        // Construction method
        function __construct() {
                parent::__construct();
				
				// The loading calculation model
				$this->load->model('calculate_model');
				
				$this->load->helper(array('form', 'url'));
        }
        
        // The default method
        function index() {
                // Load the calculate_view view
                $this->load->view('calculate_view');
        }
		
		function count() {
			// Using the input class receives parameters
			$num1 = $this->input->post('num1');
			$op = $this->input->post('operate');
			$num2 = $this->input->post('num2');
			
			if (is_numeric($num1) && is_numeric($num2)) {
					// If the two input is digital, it calls the calculate_model model of count method
					$result = $this->calculate_model->count($num1, $num2, $op);
					// Generation to be passed to the view of data
					$data = array('num1' => $num1, 'num2' => $num2, 'op' => $op, 'result' => $result);
					// Load view
					$this->load->view('result_view', $data);
			}
		}
}

/* End of file calculate.php */
/* Location: ./application/controllers/calculate.php */