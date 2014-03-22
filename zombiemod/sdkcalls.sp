/**
 * =============================================================================
 * Zombie Mod for Day of Defeat Source
 *
 * By: Andersso
 *
 * SourceMod (C)2004-2008 AlliedModders LLC.  All rights reserved.
 * =============================================================================
 *
 * This program is free software; you can redistribute it and/or modify it under
 * the terms of the GNU General Public License, version 3.0, as published by the
 * Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
 * details.
 *
 * You should have received a copy of the GNU General Public License along with
 * this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * As a special exception, AlliedModders LLC gives you permission to link the
 * code of this program (as well as its derivative works) to "Half-Life 2," the
 * "Source Engine," the "SourcePawn JIT," and any Game MODs that run on software
 * by the Valve Corporation.  You must obey the GNU General Public License in
 * all respects for all other code used.  Additionally, AlliedModders LLC grants
 * this exception to all derivative works.  AlliedModders LLC defines further
 * exceptions, found in LICENSE.txt (as of this writing, version JULY-31-2007),
 * or <http://www.sourcemod.net/license.php>.
 */

new Handle:g_hSDKCall_EmitSound;

InitSDKCalls()
{
	new Handle:gameConf = LoadGameConfigFile("plugin.zombiemod");

	if (!gameConf)
	{
		SetFailState("Failed to load game config: \"plugin.zombiemod\"!");
	}

	// void CBaseEntity::EmitSound(const char *soundname, float soundtime = 0.0f, float *duration = NULL)
	StartPrepSDKCall(SDKCall_Entity);

	PrepSDKCall_SetFromConf(gameConf, SDKConf_Signature, "EmitSound");

	PrepSDKCall_AddParameter(SDKType_String, SDKPass_Pointer);
	PrepSDKCall_AddParameter(SDKType_Float, SDKPass_Plain);
	PrepSDKCall_AddParameter(SDKType_PlainOldData, SDKPass_Plain);

	if (!(g_hSDKCall_EmitSound = EndPrepSDKCall()))
	{
		SetFailState("Failed to initialize SDK call for EmitSound!");
	}

	CloseHandle(gameConf);
}