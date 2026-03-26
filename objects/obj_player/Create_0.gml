
#region variáveis

//Iniciando minhas variaveis
//Variavel de velocidade player
vel = 2;

//Variavel tempo de espera do tiro
espera_tiro = 8;
//Variavel do timer do tiro, para contar o tempo
timer_tiro = 0;

#endregion

#region Métodos

//Fazendo sistema de movimentação de jogador
//Método de Controlar o player
Controla_player = function() 
{
	var _cima, _baixo, _dir, _esq, _atirar;
	
	_cima = keyboard_check(ord("W")) or keyboard_check(vk_up);
	
	_baixo = keyboard_check(ord("S")) or keyboard_check(vk_down);
	
	_dir = keyboard_check(ord("D")) or keyboard_check(vk_right);
	
	_esq = keyboard_check(ord("A")) or keyboard_check(vk_left);

	_atirar = keyboard_check(vk_space) or mouse_check_button(mb_left);
	
	var _velh = (_dir - _esq) * vel;
	var _velv = (_baixo - _cima) * vel;
	
	x += _velh;
	y += _velv;
	
	//Diminuindo timer do tiro
	timer_tiro--;
	
	if(_atirar && timer_tiro <= 0) 
	{
		//Criando tiro ao atirar
		//Salvando identidade (id) desse tiro 
		var _tiro = instance_create_layer(x, y, "Tiro", obj_tiro_player);
		
		_tiro.vspeed = -5;
		
		//Avisando que o timer do tiro resetou
		timer_tiro = espera_tiro;
	}
	
}

#endregion
