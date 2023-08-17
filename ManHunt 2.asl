// ManHunt 2 Autosplitter Version 2.0.0 19/8/2022
// Supports IGT/LRT/RTA
// Supports all difficulties
// Pointers and Script <by> ||LeonSReckon||

state("ManHunt2")
{
	float IGT: 0x2E5A8C, 0xF58, 0x58;
	int Menu: 0x206BA0, 0x0;
	int lvl: 0x142514, 0x0;
	int Cutscene: 0x1ABB7C, 0x14;
	float Pos: 0x3D71C0, 0x34;
}

start
{
	return current.IGT > old.IGT;
}

split
{
	return current.lvl > old.lvl || current.IGT == old.IGT && current.lvl == 14 && current.Cutscene == 1 && current.Pos > 110;
}

isLoading
{
	return current.Menu == 0 || current.Menu == 4;
}
