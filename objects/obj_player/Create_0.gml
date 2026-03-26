
#region variáveis

//Iniciando minhas variaveis
//Variavel de velocidade player e do tiro
vel = 2;
velt = 8;

//Variavel tempo de espera do tiro
espera_tiro = 8;
//Variavel do timer do tiro, para contar o tempo
timer_tiro = 0;

//Level do meu tiro
level_tiro = 1;

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
	

	//Limitando o player pra ficar dentro da room
	x = clamp(x, sprite_width/2, room_width - sprite_width/2);
	y = clamp(y, sprite_height/2, room_height - sprite_height/2);
	
	//Diminuindo timer do tiro
	timer_tiro--;
	
	if(_atirar && timer_tiro <= 0) 
	{
		if(level_tiro == 1) tiro_1();
		
		else if(level_tiro == 2) tiro_2();
		
		else if(level_tiro == 3) tiro_3();
		
		//Avisando que o timer do tiro resetou (delay do tiro)
		timer_tiro = espera_tiro;
	}
	
}

//Criando método do tiro 1
tiro_1 = function()
{
		//Criando tiro ao atirar
		//Salvando identidade (id) desse tiro 
		var _tiro = instance_create_layer(x, y, "Tiro", obj_tiro_player);
		
		_tiro.vspeed = -velt;

}

tiro_2 = function() 
{
	//Criando tiro e salvando a id do tiro
	var _tiro = instance_create_layer(x - 8, y, "Tiro", obj_tiro_player);	
	//Dando velocidade para o tiro
	_tiro.vspeed = -velt;
	
	//O mesmo para o segundo tiro
	_tiro = instance_create_layer(x + 8, y, "Tiro", obj_tiro_player);
	
	_tiro.vspeed = -velt;
	

}

tiro_3 = function()
{
	tiro_1();
	tiro_2();
	
}

ganha_level_tiro = function() 
{
	//Limitando o level do player
	if(level_tiro < 3) level_tiro++;

}
#endregion
