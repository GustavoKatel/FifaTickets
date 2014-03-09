<!-- *******TESTE********* --
<?php
	$comp1 = new Ingresso(1, 12031994, 1, 1, 1);

	$all = $comp1->get("attr");
	$comp1->set("data","mudou \o/");

	$testValidation = array(1, 1, 1, 1, 1);
	$errorValues = array(null, null, null, null, null);
	$rightValues = array(1, 12031994, 1, 1, 1);
	foreach ($all as $key => $names) {
		$comp1->set($names, $testValidation[$key] ? ($errorValues[$key]) : ($rightValues[$key]) );
	}
	foreach ($all as &$value) {
		echo $comp1->get($value)."<br>";
	}
?>
<!-- ******* END TESTE********* -->

<?php
	class Partida {
		private $id;
		private $nome;
		private $data;
		private $tipo;
		private $local_id;

		private $attr = array("id", "nome", "data", "tipo", "local_id");
		
		public function __construct($id ,$data, $forma_de_pagamento, $comprador_id){
			$args = func_get_args();
			$numArgs = func_num_args();

			if($numArgs != 5){
				echo "ERROR: Verifique se está passando todos os parametros corretamente.";
			}
			else{
				foreach ($this->attr as $key => $attrName) {
					if(Partida::validaCampo($attrName, $args[$key])){
						$this->$attrName = $args[$key];
					}
					else{
						throw new Exception(Partida::errorMsg($attrName), 1);
					}
				}
			}
		}

		public function get(/*string*/ $attrName){
			return $this->$attrName;
		}

		public function set($attrName, $attrValue){
			if(Partida::validaCampo($attrName, $attrValue)){
				$this->$attrName = $attrValue;
			}
			else{
				throw new Exception(Partida::errorMsg($attrName), 1);
			}
		}

		private static function validaCampo($attrName, $attrValue){
			$attrValue = print_r($attrValue, true);
			$tam = strlen($attrValue);

			switch ($attrName) {
				case 'id':
					return (is_numeric($attrValue));

				case 'nome':
					return ($tam <= 100 && $tam > 0);

				case 'tipo':
					return ($tam <= 10 && $tam > 0);

				case 'local_id':
					return (is_numeric($attrValue));
			}
		}

		private static function errorMsg($attrName){
			switch ($attrName) {
				case 'data':
					return 'O campo "'.$attrName.'" é obrigatório. Por favor, tente novamente.';

				default:
					return "Erro de validação. Atributo com erro: ".$attrName;

			}
		}
	}
?>