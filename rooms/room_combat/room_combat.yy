
{
    "name": "room_combat",
    "id": "84167d2e-4ad6-40ec-a762-c227db1425a5",
    "creationCodeFile": "RoomCreationCode.gml",
    "inheritCode": false,
    "inheritCreationOrder": false,
    "inheritLayers": false,
    "instanceCreationOrderIDs": [
        "49edd736-0570-4eb4-90c3-906274b1885b",
        "8ed4c3ff-6fbc-4775-af12-f1944783e841"
    ],
    "IsDnD": false,
    "layers": [
        {
            "__type": "GMRInstanceLayer_Model:#YoYoStudio.MVCFormat",
            "name": "Controllers",
            "id": "0643bf61-d3aa-46e7-ae0e-d6d0165f176c",
            "depth": 0,
            "grid_x": 16,
            "grid_y": 16,
            "hierarchyFrozen": false,
            "hierarchyVisible": true,
            "inheritLayerDepth": false,
            "inheritLayerSettings": false,
            "inheritSubLayers": false,
            "inheritVisibility": false,
            "instances": [
{"name": "inst_3B8113EC","id": "8ed4c3ff-6fbc-4775-af12-f1944783e841","colour": { "Value": 4294967295 },"creationCodeFile": "","creationCodeType": "","ignore": false,"inheritCode": false,"inheritItemSettings": false,"IsDnD": false,"m_originalParentID": "00000000-0000-0000-0000-000000000000","m_serialiseFrozen": false,"modelName": "GMRInstance","name_with_no_file_rename": "inst_3B8113EC","objId": "a093324c-359c-46f1-99ec-db4ce56f9b18","properties": null,"rotation": 0,"scaleX": 1,"scaleY": 1,"mvc": "1.0","x": 0,"y": 0}
            ],
            "layers": [

            ],
            "m_parentID": "00000000-0000-0000-0000-000000000000",
            "m_serialiseFrozen": false,
            "modelName": "GMRInstanceLayer",
            "mvc": "1.0",
            "userdefined_depth": false,
            "visible": true
        },
        {
            "__type": "GMRInstanceLayer_Model:#YoYoStudio.MVCFormat",
            "name": "Overlays",
            "id": "c8469f65-1763-4385-89cb-438f8e29f611",
            "depth": 100,
            "grid_x": 16,
            "grid_y": 16,
            "hierarchyFrozen": false,
            "hierarchyVisible": true,
            "inheritLayerDepth": false,
            "inheritLayerSettings": false,
            "inheritSubLayers": false,
            "inheritVisibility": false,
            "instances": [

            ],
            "layers": [
                {
                    "__type": "GMRBackgroundLayer_Model:#YoYoStudio.MVCFormat",
                    "name": "Overlays_background",
                    "id": "d83f72a9-70b0-4643-bb5f-f32a6bb0a45e",
                    "animationFPS": 15,
                    "animationSpeedType": "0",
                    "colour": { "Value": 4294967295 },
                    "depth": 200,
                    "grid_x": 32,
                    "grid_y": 32,
                    "hierarchyFrozen": false,
                    "hierarchyVisible": false,
                    "hspeed": 0,
                    "htiled": false,
                    "inheritLayerDepth": false,
                    "inheritLayerSettings": false,
                    "inheritSubLayers": false,
                    "inheritVisibility": false,
                    "layers": [

                    ],
                    "m_parentID": "00000000-0000-0000-0000-000000000000",
                    "m_serialiseFrozen": false,
                    "modelName": "GMRBackgroundLayer",
                    "mvc": "1.0",
                    "spriteId": "00000000-0000-0000-0000-000000000000",
                    "stretch": false,
                    "userdefined_animFPS": false,
                    "userdefined_depth": false,
                    "visible": false,
                    "vspeed": 0,
                    "vtiled": false,
                    "x": 0,
                    "y": 0
                }
            ],
            "m_parentID": "00000000-0000-0000-0000-000000000000",
            "m_serialiseFrozen": false,
            "modelName": "GMRInstanceLayer",
            "mvc": "1.0",
            "userdefined_depth": false,
            "visible": true
        },
        {
            "__type": "GMRInstanceLayer_Model:#YoYoStudio.MVCFormat",
            "name": "Instances",
            "id": "87296c6b-36ca-4f21-abb4-cd6124957517",
            "depth": 300,
            "grid_x": 16,
            "grid_y": 16,
            "hierarchyFrozen": false,
            "hierarchyVisible": true,
            "inheritLayerDepth": false,
            "inheritLayerSettings": false,
            "inheritSubLayers": false,
            "inheritVisibility": false,
            "instances": [
{"name": "inst_789A87F6","id": "49edd736-0570-4eb4-90c3-906274b1885b","colour": { "Value": 4294967295 },"creationCodeFile": "","creationCodeType": "","ignore": false,"inheritCode": false,"inheritItemSettings": false,"IsDnD": false,"m_originalParentID": "00000000-0000-0000-0000-000000000000","m_serialiseFrozen": false,"modelName": "GMRInstance","name_with_no_file_rename": "inst_789A87F6","objId": "4d2a7c6c-ed28-45d7-93e7-14c120e7ff77","properties": null,"rotation": 0,"scaleX": 1,"scaleY": 1,"mvc": "1.0","x": 448,"y": 160}
            ],
            "layers": [
                {
                    "__type": "GMRInstanceLayer_Model:#YoYoStudio.MVCFormat",
                    "name": "Instances_highlighted",
                    "id": "bc487905-9e48-4718-9d29-4559c4f10bd6",
                    "depth": 400,
                    "grid_x": 32,
                    "grid_y": 32,
                    "hierarchyFrozen": false,
                    "hierarchyVisible": true,
                    "inheritLayerDepth": false,
                    "inheritLayerSettings": false,
                    "inheritSubLayers": false,
                    "inheritVisibility": false,
                    "instances": [

                    ],
                    "layers": [

                    ],
                    "m_parentID": "00000000-0000-0000-0000-000000000000",
                    "m_serialiseFrozen": false,
                    "modelName": "GMRInstanceLayer",
                    "mvc": "1.0",
                    "userdefined_depth": false,
                    "visible": true
                },
                {
                    "__type": "GMRInstanceLayer_Model:#YoYoStudio.MVCFormat",
                    "name": "Instances_default",
                    "id": "4ca54966-a266-42d4-955c-201157c994be",
                    "depth": 500,
                    "grid_x": 32,
                    "grid_y": 32,
                    "hierarchyFrozen": false,
                    "hierarchyVisible": true,
                    "inheritLayerDepth": false,
                    "inheritLayerSettings": false,
                    "inheritSubLayers": false,
                    "inheritVisibility": false,
                    "instances": [

                    ],
                    "layers": [

                    ],
                    "m_parentID": "00000000-0000-0000-0000-000000000000",
                    "m_serialiseFrozen": false,
                    "modelName": "GMRInstanceLayer",
                    "mvc": "1.0",
                    "userdefined_depth": false,
                    "visible": true
                }
            ],
            "m_parentID": "00000000-0000-0000-0000-000000000000",
            "m_serialiseFrozen": false,
            "modelName": "GMRInstanceLayer",
            "mvc": "1.0",
            "userdefined_depth": false,
            "visible": true
        },
        {
            "__type": "GMRBackgroundLayer_Model:#YoYoStudio.MVCFormat",
            "name": "Background",
            "id": "b3c66bc1-dc69-4a9a-aea8-b024d5f4a5bd",
            "animationFPS": 15,
            "animationSpeedType": "0",
            "colour": { "Value": 4278190080 },
            "depth": 600,
            "grid_x": 32,
            "grid_y": 32,
            "hierarchyFrozen": false,
            "hierarchyVisible": true,
            "hspeed": 0,
            "htiled": false,
            "inheritLayerDepth": false,
            "inheritLayerSettings": false,
            "inheritSubLayers": false,
            "inheritVisibility": false,
            "layers": [

            ],
            "m_parentID": "00000000-0000-0000-0000-000000000000",
            "m_serialiseFrozen": false,
            "modelName": "GMRBackgroundLayer",
            "mvc": "1.0",
            "spriteId": "00000000-0000-0000-0000-000000000000",
            "stretch": false,
            "userdefined_animFPS": false,
            "userdefined_depth": false,
            "visible": true,
            "vspeed": 0,
            "vtiled": false,
            "x": 0,
            "y": 0
        }
    ],
    "modelName": "GMRoom",
    "parentId": "00000000-0000-0000-0000-000000000000",
    "physicsSettings":     {
        "id": "7f094a9d-f7d5-4883-92d2-a91d9095d745",
        "inheritPhysicsSettings": false,
        "modelName": "GMRoomPhysicsSettings",
        "PhysicsWorld": false,
        "PhysicsWorldGravityX": 0,
        "PhysicsWorldGravityY": 10,
        "PhysicsWorldPixToMeters": 0.1,
        "mvc": "1.0"
    },
    "roomSettings":     {
        "id": "60c04c45-f923-469e-b0e4-ad8e51df24ee",
        "Height": 320,
        "inheritRoomSettings": false,
        "modelName": "GMRoomSettings",
        "persistent": false,
        "mvc": "1.0",
        "Width": 512
    },
    "mvc": "1.0",
    "views": [
{"id": "09119fd0-b3d3-47eb-8aed-92b48069d6a0","hborder": 32,"hport": 768,"hspeed": -1,"hview": 768,"inherit": false,"modelName": "GMRView","objId": "00000000-0000-0000-0000-000000000000","mvc": "1.0","vborder": 32,"visible": false,"vspeed": -1,"wport": 1024,"wview": 1024,"xport": 0,"xview": 0,"yport": 0,"yview": 0},
{"id": "8dbfa635-4139-4246-b79d-83c4a95487e8","hborder": 32,"hport": 768,"hspeed": -1,"hview": 768,"inherit": false,"modelName": "GMRView","objId": "00000000-0000-0000-0000-000000000000","mvc": "1.0","vborder": 32,"visible": false,"vspeed": -1,"wport": 1024,"wview": 1024,"xport": 0,"xview": 0,"yport": 0,"yview": 0},
{"id": "8f245f7a-9f95-4e01-b25d-61d4fdf32dbb","hborder": 32,"hport": 768,"hspeed": -1,"hview": 768,"inherit": false,"modelName": "GMRView","objId": "00000000-0000-0000-0000-000000000000","mvc": "1.0","vborder": 32,"visible": false,"vspeed": -1,"wport": 1024,"wview": 1024,"xport": 0,"xview": 0,"yport": 0,"yview": 0},
{"id": "f4370a8b-ae57-4835-bcac-d9bdc161b68a","hborder": 32,"hport": 768,"hspeed": -1,"hview": 768,"inherit": false,"modelName": "GMRView","objId": "00000000-0000-0000-0000-000000000000","mvc": "1.0","vborder": 32,"visible": false,"vspeed": -1,"wport": 1024,"wview": 1024,"xport": 0,"xview": 0,"yport": 0,"yview": 0},
{"id": "b044ff96-9094-4a87-8fcf-e03efbb765d5","hborder": 32,"hport": 768,"hspeed": -1,"hview": 768,"inherit": false,"modelName": "GMRView","objId": "00000000-0000-0000-0000-000000000000","mvc": "1.0","vborder": 32,"visible": false,"vspeed": -1,"wport": 1024,"wview": 1024,"xport": 0,"xview": 0,"yport": 0,"yview": 0},
{"id": "e2b77d54-85a4-4959-98d7-41ecc2c48cbb","hborder": 32,"hport": 768,"hspeed": -1,"hview": 768,"inherit": false,"modelName": "GMRView","objId": "00000000-0000-0000-0000-000000000000","mvc": "1.0","vborder": 32,"visible": false,"vspeed": -1,"wport": 1024,"wview": 1024,"xport": 0,"xview": 0,"yport": 0,"yview": 0},
{"id": "7be17687-c8d1-42c3-8655-4271a7d61220","hborder": 32,"hport": 768,"hspeed": -1,"hview": 768,"inherit": false,"modelName": "GMRView","objId": "00000000-0000-0000-0000-000000000000","mvc": "1.0","vborder": 32,"visible": false,"vspeed": -1,"wport": 1024,"wview": 1024,"xport": 0,"xview": 0,"yport": 0,"yview": 0},
{"id": "b408f4d6-1b50-49c3-9514-5a4cbf77aa59","hborder": 32,"hport": 768,"hspeed": -1,"hview": 768,"inherit": false,"modelName": "GMRView","objId": "00000000-0000-0000-0000-000000000000","mvc": "1.0","vborder": 32,"visible": false,"vspeed": -1,"wport": 1024,"wview": 1024,"xport": 0,"xview": 0,"yport": 0,"yview": 0}
    ],
    "viewSettings":     {
        "id": "f0b86545-b80f-42b8-91ad-ca8bb8894fbf",
        "clearDisplayBuffer": true,
        "clearViewBackground": false,
        "enableViews": false,
        "inheritViewSettings": false,
        "modelName": "GMRoomViewSettings",
        "mvc": "1.0"
    }
}