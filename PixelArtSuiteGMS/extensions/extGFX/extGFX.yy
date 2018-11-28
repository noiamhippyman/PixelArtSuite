{
    "id": "8e222b35-6d8f-46a8-b9b8-9da6e5b3bd40",
    "modelName": "GMExtension",
    "mvc": "1.0",
    "name": "extGFX",
    "IncludedResources": [
        
    ],
    "androidPermissions": [
        
    ],
    "androidProps": false,
    "androidactivityinject": "",
    "androidclassname": "",
    "androidinject": "",
    "androidmanifestinject": "",
    "androidsourcedir": "",
    "author": "",
    "classname": "",
    "copyToTargets": 35184372088896,
    "date": "2018-11-28 09:05:04",
    "description": "",
    "extensionName": "",
    "files": [
        {
            "id": "8409f3c2-8012-405f-b2ad-1c5d2cebb5eb",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                
            ],
            "copyToTargets": 144678176683983086,
            "filename": "PixelArtSuite.dll",
            "final": "",
            "functions": [
                {
                    "id": "1d69bbc2-2c65-4ed3-819a-92bfcf58fa4b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "gfx_init",
                    "help": "gfx_init();",
                    "hidden": false,
                    "kind": 1,
                    "name": "gfx_init",
                    "returnType": 2
                },
                {
                    "id": "6f5fc7ff-3c12-4649-b92a-437a18eaca4a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "gfx_free",
                    "help": "gfx_free();",
                    "hidden": false,
                    "kind": 1,
                    "name": "gfx_free",
                    "returnType": 2
                },
                {
                    "id": "d02dd52a-ca58-49c3-9a5e-c67d68246b6b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "gfx_set_screen_buffer",
                    "help": "gfx_set_screen_buffer(bufferAddress);",
                    "hidden": false,
                    "kind": 1,
                    "name": "gfx_set_screen_buffer",
                    "returnType": 2
                },
                {
                    "id": "24317383-81e3-41a6-9dd7-08f70c9eb6cb",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2,
                        2
                    ],
                    "externalName": "gfx_set_screen_size",
                    "help": "gfx_set_screen_size(width,height);",
                    "hidden": false,
                    "kind": 1,
                    "name": "gfx_set_screen_size",
                    "returnType": 2
                },
                {
                    "id": "547b6c83-84a6-4d2e-97a5-8b0a75de8758",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "gfx_needs_update",
                    "help": "gfx_needs_update();",
                    "hidden": false,
                    "kind": 1,
                    "name": "gfx_needs_update",
                    "returnType": 2
                },
                {
                    "id": "49f74ac0-ff4d-449a-8a9d-91c2eb9c1928",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2,
                        2,
                        2,
                        2
                    ],
                    "externalName": "gfx_clear_screen",
                    "help": "gfx_clear_screen(r,g,b,a);",
                    "hidden": false,
                    "kind": 1,
                    "name": "gfx_clear_screen",
                    "returnType": 2
                },
                {
                    "id": "9ee79982-bf06-4862-b51c-704e4f128892",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2,
                        2,
                        2,
                        2,
                        2,
                        2
                    ],
                    "externalName": "gfx_set_pixel",
                    "help": "gfx_set_pixel(x,y,r,g,b,a);",
                    "hidden": false,
                    "kind": 1,
                    "name": "gfx_set_pixel",
                    "returnType": 2
                },
                {
                    "id": "e15a546e-620f-4db9-82c0-ca7672637078",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2,
                        2,
                        2,
                        2,
                        2,
                        2,
                        2,
                        2
                    ],
                    "externalName": "gfx_draw_line",
                    "help": "gfx_draw_line(x1,y1,x2,y2,r,g,b,a);",
                    "hidden": false,
                    "kind": 1,
                    "name": "gfx_draw_line",
                    "returnType": 2
                },
                {
                    "id": "eb254b5f-2743-42aa-ad4e-250ab2bbe344",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2,
                        2,
                        2,
                        2,
                        2,
                        2,
                        2,
                        2
                    ],
                    "externalName": "gfx_draw_circle",
                    "help": "gfx_draw_circle(x,y,radius,r,g,b,a,outline);",
                    "hidden": false,
                    "kind": 1,
                    "name": "gfx_draw_circle",
                    "returnType": 2
                },
                {
                    "id": "23582bad-8671-4ad3-87e1-24764f5e914d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2,
                        2,
                        2,
                        2,
                        2,
                        2,
                        2,
                        2,
                        2
                    ],
                    "externalName": "",
                    "help": "gfx_draw_rectangle(x1,y1,x2,y2,r,g,b,a,outline);",
                    "hidden": false,
                    "kind": 1,
                    "name": "gfx_draw_rectangle",
                    "returnType": 2
                },
                {
                    "id": "cad0957a-7c00-4538-b46b-4cec254bb924",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "gfx_set_blend_enabled",
                    "help": "gfx_set_blend_enabled(enable);",
                    "hidden": false,
                    "kind": 1,
                    "name": "gfx_set_blend_enabled",
                    "returnType": 2
                },
                {
                    "id": "29a86bc6-c9e5-4f3d-84ab-daccc1401c0c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "gfx_get_blend_enabled",
                    "help": "gfx_get_blend_enabled();",
                    "hidden": false,
                    "kind": 1,
                    "name": "gfx_get_blend_enabled",
                    "returnType": 2
                }
            ],
            "init": "",
            "kind": 1,
            "order": [
                "1d69bbc2-2c65-4ed3-819a-92bfcf58fa4b",
                "6f5fc7ff-3c12-4649-b92a-437a18eaca4a",
                "d02dd52a-ca58-49c3-9a5e-c67d68246b6b",
                "24317383-81e3-41a6-9dd7-08f70c9eb6cb",
                "547b6c83-84a6-4d2e-97a5-8b0a75de8758",
                "49f74ac0-ff4d-449a-8a9d-91c2eb9c1928",
                "9ee79982-bf06-4862-b51c-704e4f128892",
                "e15a546e-620f-4db9-82c0-ca7672637078",
                "eb254b5f-2743-42aa-ad4e-250ab2bbe344",
                "23582bad-8671-4ad3-87e1-24764f5e914d",
                "cad0957a-7c00-4538-b46b-4cec254bb924",
                "29a86bc6-c9e5-4f3d-84ab-daccc1401c0c"
            ],
            "origname": "",
            "uncompress": false
        },
        {
            "id": "1ec335d7-457b-4065-99cc-40945dbb49f3",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                
            ],
            "copyToTargets": -1,
            "filename": "extGFX.gml",
            "final": "",
            "functions": [
                {
                    "id": "bb29d14e-92cd-4958-b264-d14c85bd869c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2,
                        2,
                        2
                    ],
                    "externalName": "gfx_set_screen_target",
                    "help": "gfx_set_screen_target(buffer,width,height);",
                    "hidden": false,
                    "kind": 2,
                    "name": "gfx_set_screen_target",
                    "returnType": 2
                }
            ],
            "init": "",
            "kind": 2,
            "order": [
                "bb29d14e-92cd-4958-b264-d14c85bd869c"
            ],
            "origname": "",
            "uncompress": false
        }
    ],
    "gradleinject": "",
    "helpfile": "",
    "installdir": "",
    "iosProps": false,
    "iosSystemFrameworkEntries": [
        
    ],
    "iosThirdPartyFrameworkEntries": [
        
    ],
    "iosplistinject": "",
    "license": "",
    "maccompilerflags": "",
    "maclinkerflags": "",
    "macsourcedir": "",
    "packageID": "",
    "productID": "",
    "sourcedir": "",
    "tvosProps": false,
    "tvosSystemFrameworkEntries": [
        
    ],
    "tvosThirdPartyFrameworkEntries": [
        
    ],
    "tvosclassname": null,
    "tvosmaccompilerflags": null,
    "tvosmaclinkerflags": null,
    "tvosplistinject": null,
    "version": "0.0.1"
}