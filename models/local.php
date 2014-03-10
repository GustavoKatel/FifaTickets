<!-- ******* TESTE ********* --
<?phpabc
	$comp1 = new Comprador(1,"ygor", 123456789, 123456789, "PB", "João Pessoa", "dos milagres", "cristo", "do lado da minha vizinha", "12345678901234567890123456789012");

	$all = $comp1->get("attr");
	$comp1->set("nome","mudou \o/");

	$testValidation = array(0, 0, 0, 0, 0, 0, 0, 0, 1, 0);
	$errorValues = array(null, null, null, null, null, null, null, null, null, null);
	$rightValues = array(1,"ygor", 123456789, 123456789, "PB", "João Pessoa", "dos milagres", "cristo", "do lado da minha vizinha", "12345678901234567890123456789012");
	foreach ($all as $key => $names) {
		$comp1->set($names, $testValidation[$key] ? ($errorValues[$key]) : ($rightValues[$key]) );
	}

	foreach ($all as &$value) {
		echo $comp1->get($value)."<br>";
	}
?>
<!-- ******* END TESTE ********* -->

<?php
	class Local {
		private $id;
		private $nome;
		private $estado;
		private $cidade;
		private $rua;
		private $bairro;
		private $capacidade;

		private $attr = array("id", "nome", "estado", "cidade", "rua", "bairro", "capacidade");
		
		public function __construct($id, $nome, , $estado, $cidade, $rua, $bairro, $capacidade){
			$args = func_get_args();
			$numArgs = func_num_args();

			if($numArgs != 5){
				echo "ERROR: Verifique se está passando todos os parametros corretamente.";
			}
			else{
				foreach ($this->attr as $key => $attrName) {
					if(Local::validaCampo($attrName, $args[$key])){
						$this->$attrName = $args[$key];
					}
					else{
						throw new Exception(Local::errorMsg($attrName), 1);
					}
				}
			}
		}

		public function get(/*string*/ $attrName){
			return $this->$attrName;
		}

		public function set($attrName, $attrValue){
			if(Local::validaCampo($attrName, $attrValue)){
				$this->$attrName = $attrValue;
			}
			else{
				throw new Exception(Local::errorMsg($attrName), 1);
			}
		}

		private static function validaCampo($attrName, $attrValue){
			$attrValue = print_r($attrValue, true);
			$tam = strlen($attrValue);

			switch ($attrName) {
				case 'id':
					return (is_numeric($attrValue));

				case 'nome':
					return ($tam > 0 && $tam <= 30);
					
				case 'estado':
				case 'cidade':
				case 'bairro':
					return ($tam <= 20 && $tam > 0);
								
				case 'rua':
					return ($tam <= 100 && $tam > 0);

				case 'capacidade':
					return ((int)$attrValue) >= 0;

				case 'attr':
					return false;

				default:
					throw new Exception("O atributo ".$attrName." não pertence a esta classe. Atributo desconhecido!", 1);
					
			}
		}

		private static function errorMsg($attrName){
			switch ($attrName) {
				case 'attr':
					return 'O atributo attr não deve ser modificado. Somente leitura!';

				case 'nome':
					return 'O campo "Nome" é obrigatório. Por favor, tente novamente.';
				
				case 'estado':
				case 'cidade':
				case 'bairro':
					return 'O campo "'.$attrName.'" é de preenchimento obrigatório e deve ter no máximo 20 caracteres. Por favor, tente novamente.';
								
				case 'rua':
					return 'O campo "'.$attrName.'" é de preenchimento obrigatório e deve ter no máximo 100 caracteres. Por favor, tente novamente.';
				
				case 'capacidade':
					return 'Valor inválido para o campo "'.$attrName.'".';

				default:
					return "Erro de validação. Atributo com erro: ".$attrName;

			}
		}
	}
?>
