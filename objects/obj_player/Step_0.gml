
//Ativando e desativando debug
if(keyboard_check_released(vk_tab))
{
	global.debug = !global.debug;
}

//Chamando metodo de controle do player
Controla_player();


if(keyboard_check_pressed(ord("O"))) level_tiro++;

if(keyboard_check_pressed(ord("L"))) level_tiro--;