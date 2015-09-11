<?php
/**
 * The calculation model, the name of the first letter should be capitalized, all model must inherit from the CI_Model class
 */
class Calculate_model extends CI_Model {
        
        function __construct() {
                parent::__construct();
        }
        
        /*
         * The calculation function
         */
        function count($num1, $num2, $op) {
                if ($op == "+") {
                        return $num1 + $num2;
                }else if ($op == "-") {
                        return $num1 - $num2;
                }else if ($op == "x") {
                        return $num1 * $num2;
                }else if ($op == "//" && $num2 != 0) {
                        return $num1 / 1.0 / $num2; 
                }else {
                        return FALSE;
                }
        }
}

/* End of file calculate_model.php */
/* Location: ./application/models/calculate_model.php */