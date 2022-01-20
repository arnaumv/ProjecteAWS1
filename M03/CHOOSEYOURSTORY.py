import usuario
import passw
import funciones
import pymysql

conn=pymysql.connect(host='localhost',user='arnau',password='',db='AdventureGame')

cur=conn.cursor()
id_history='1'
name='Arnau'
data_for_each_item='19/1/2022'
decision_making='facil'

query=f"insert into llibres values ('{id_history}','{name}','{data_for_each_item}','{decision_making}')"
cur.execute(query)
conn.commit()
conn.close()

game_context = {}
dict_characters = {1: {"name": "Luffy", "category": 1, "weapons": [1, 1], "strength": 6, "speed": 7, "experience": 0},
                   2: {"name": "Zoro", "category": 1, "weapons": [4], "strength": 5, "speed": 6, "experience": 0},
                   3: {"name": "Sanji", "category": 1, "weapons": [1, 3], "strength": 4, "speed": 6, "experience": 0},
                   4: {"name": "Buggy", "category": 2, "weapons": [3], "strength": 2, "speed": 4, "experience": 0},
                   5: {"name": "Mr3", "category": 2, "weapons": [5], "strength": 3, "speed": 2, "experience": 0},
                   6: {"name": "Xebec", "category": 3, "weapons": [1, 3], "strength": 6, "speed": 5,
                       "experience": 0},
                   7: {"name": "Kaido", "category": 3, "weapons": [4], "strength": 8, "speed": 3,
                       "experience": 0},
                   8: {"name": "Mama grande", "category": 3, "weapons": [5], "strength": 7, "speed": 1,
                       "experience": 0},
                   9: {"name": "Akainu", "category": 4, "weapons": [2], "strength": 6, "speed": 4,
                       "experience": 0},
                   10: {"name": "Kizaru", "category": 4, "weapons": [1, 3], "strength": 5, "speed": 8,
                        "experience": 0},
                   11: {"name": "Fujitora", "category": 4, "weapons": [5], "strength": 5, "speed": 4,
                        "experience": 0},
                   12: {"name": "Garp", "category": 5, "weapons": [2], "strength": 6, "speed": 3,
                        "experience": 0},
                   13: {"name": "Smoker", "category": 5, "weapons": [5], "strength": 5, "speed": 5, "experience": 0},
                   14: {"name": "Koby", "category": 6, "weapons": [4], "strength": 3, "speed": 4, "experience": 0},
                   15: {"name": "Tashigi", "category": 6, "weapons": [3], "strength": 4, "speed": 4, "experience": 0}, }
dict_weapons = {1: {"name": "Sword", "strength": 3, "speed": 5, "two_hand": False},
                2: {"name": "Greatsword", "strength": 5, "speed": 3, "two_hand": True},
                3: {"name": "Gun", "strength": 2, "speed": 6, "two_hand": False},
                4: {"name": "Rifle", "strength": 3, "speed": 4, "two_hand": True},
                5: {"name": "Chuchi", "strength": 4, "speed": 4, "two_hand": True},
                }
dict_crews = {1: {"name": "Straw hat", "members": [8, 6]},
              2: {"name": "Pirates Buggy", "members": [1, 3, 5]},
              3: {"name": "Pirates Rocks", "members": [2, 4, 7, ]}
              }
dict_ranks = {1: {"name": "Admiral", "members": [9, 10, 11]},
              2: {"name": "ViceAdmiral", "members": [12, 13]},
              3: {"name": "Lieutenant", "members": [14, 15]}
              }
dict_categorys = {1: "Straw hat", 2: "Pirates Buggy", 3: "Pirates Rocks", 4: "Admiral", 5: "ViceAdmiral",
                  6: "Lieutenant"}
while True:

    print("*" * 105 )
    print(
        "        **     *******   **      ** ******** ****     ** ********** **     ** *******   ********               ********      **     ****     **** ******** ")
    print(
        "       ****   /**////** /**     /**/**///// /**/**   /**/////**/// /**    /**/**////** /**/////               **//////**    ****   /**/**   **/**/**///// ")
    print(
        "      **//**  /**    /**/**     /**/**      /**//**  /**    /**    /**    /**/**   /** /**                   **      //    **//**  /**//** ** /**/**  ")
    print(
        "     **  //** /**    /**//**    ** /******* /** //** /**    /**    /**    /**/*******  /*******             /**           **  //** /** //***  /**/******* ")
    print(
        "    **********/**    /** //**  **  /**////  /**  //**/**    /**    /**    /**/**///**  /**////              /**    ***** **********/**  //*   /**/**//// ")
    print(
        "   /**//////**/**    **   //****   /**      /**   //****    /**    /**    /**/**  //** /**                  //**  ////**/**//////**/**   /    /**/**     ")
    print(
        "   /**     /**/*******     //**    /********/**    //***    /**    //******* /**   //**/********             //******** /**     /**/**        /**/******** ")
    print(
        "   //      // ///////       //     //////// //      ///     //      ///////  //     // ////////               ////////  //      // //         // //////// ")



    print("*" * 105)


    menu0 = "**\n".ljust(45) + "1)Login\n".ljust(50) + "2)Create User\n".ljust(56) + "3)Replay Adventure\n".ljust(
        61) + "4) Reports\n".ljust(53) + "5) Exit\n\n".ljust(51) + "Option: \n"
    print(menu0)


    opc_menu0 = input("")


    if not opc_menu0.isdigit():
        print("=============== Invalid option ===============")
    elif int(opc_menu0) < 1 or int(opc_menu0) > 5:
        print("=============== Invalid option ===============")
        input("Press enter to continue..")
    else:
        opc_menu0 = int(opc_menu0)
        if opc_menu0 == 5:
          break


    if opc_menu0 == 1:  ################# LOGIN #########
        while True:
            correcto = False
            while correcto == False:
                nombre = input("Username: ")
                if usuario.nickname(nombre) == True:
                    print("Usuario creado exitosamente")
                    correcto = True

            while correcto == True:
                contraseña = input("Password: ")
                if passw.clave(contraseña) == True:
                    print("Contraseña creada exitosamente")
        correcto = False
        insertUser(conexion, (id_user, user, password))
        break









        #
        # if opc_menu0 == 2:  ########## MENU 2 ################
        #     while True:
        #         print("========Menu 02 Create ========\n")
        #         print("1)Create Character\n2)Create weapon\n3)Go Back")
        #         opc_menu02 = input("Opcion:")
        #         if not opc_menu02.isdigit():
        #             print("=" * 4, "Invalid option", "=" * 4, "\n")
        #         elif int(opc_menu02) < 1 or int(opc_menu02) > 3:
        #             print("Invalidd Option")
        #         else:
        #             opc_menu02 = int(opc_menu02)
        #             if opc_menu02 == 3:
        #                 break
        #
        #             elif opc_menu02 == 1:  ########## MENU 2.1 ################
        #                 print("========Menu 021 New Character========\n")
        #                 name = input("Name of the new character: \n")
        #                 while True:
        #                     print("Side of the new character: ")
        #                     print("1)Marine\n2)Pirate\n")
        #                     side = input("-->Option:")
        #                     side = int(side)
        #                     if side != 1 and side != 2:
        #                         print("=" * 4, "Invalid option", "=" * 4, "\n")
        #                         break
        #                     while True:
        #                         if side == 1:
        #                             print("Range or crew of the new character:")
        #                             print("1)Admiral\n2)ViceAdmiral\n3)Lieutenant")
        #                             range = input("-->Option:")
        #                             range = int(range)
        #                         elif side == 2:
        #                             print("Range or crew of the new character:")
        #                             print("1)Straw hat\n2)Pirates Buggy\n3)Pirates Rocks")
        #                             range = input("-->Option:")
        #                             range = int(range)
        #                         elif range != 1 and range != 2 and range != 3:
        #                             print("=" * 4, "Invalid option", "=" * 4, "\n")
        #                             break
        #                         character_weapons = []
        #                         available_weapons = list(dict_weapons.values())
        #                         hands = 0
        #                         while True:
        #                             if range != 1 and range != 2 and range != 3:
        #                                 print("=" * 4, "Invalid option", "=" * 4, "\n")
        #                                 break
        #                             edition = True
        #                             while True and edition:
        #                                 print("=========Available weapons=========")
        #                                 weapon_id_list = list(dict_weapons.keys())
        #                                 for weapon in available_weapons:
        #                                     id = 0
        #                                     for i in weapon_id_list:
        #                                         if dict_weapons[i]["name"] == weapon["name"]:
        #                                             id = i
        #                                     print(str(id) + ") " + weapon["name"] + ", Strength: " + str(
        #                                         weapon["strength"]) + ", Speed: " + str(weapon["speed"]) + "\n")
        #                                 print("=========Character weapons=========")
        #                                 for weapon in character_weapons:
        #                                     id = 0
        #                                     for i in weapon_id_list:
        #                                         if dict_weapons[i]["name"] == weapon["name"]:
        #                                             id = i
        #                                     print(str(id) + ") " + weapon["name"] + ", Strength: " + str(
        #                                         weapon["strength"]) + ", Speed: " + str(weapon["speed"]) + "\n")
        #                                 print("Add weapons:\n")
        #                                 print("  Weapon Id) To add weapon Id\n")
        #                                 print("  0) Finish add weapons\n")
        #                                 print("  -Weapon Id) Delete weapon Id")
        #                                 weapon_option = input("  ->Option: ")
        #                                 weapon_option = int(weapon_option)
        #                                 if weapon_option > 0:
        #                                     weapon = dict_weapons[weapon_option]
        #                                     new_availables = []
        #                                     for available_weapon in available_weapons:
        #                                         if available_weapon["name"] == weapon["name"]:
        #                                             character_weapons.append(dict_weapons[weapon_option])
        #                                             if weapon["two_hand"]:
        #                                                 hands = 2
        #                                             else:
        #                                                 hands += 1
        #                                             if hands == 2:
        #                                                 available_weapons = []
        #                                             else:
        #                                                 for w in available_weapons:
        #                                                     if not w["two_hand"]:
        #                                                         new_availables.append(w)
        #                                                 available_weapons = new_availables
        #                                     break
        #                                 elif weapon_option < 0:
        #                                     weapon = dict_weapons[abs(weapon_option)]
        #                                     if weapon["name"] == character_weapons[0]["name"] or weapon["name"] == \
        #                                             character_weapons[1]["name"]:
        #                                         if weapon["two_hand"] or hands == 1:
        #                                             character_weapons = []
        #                                             available_weapons = list(dict_weapons.values())
        #                                             hands = 0
        #                                         else:
        #                                             for w in character_weapons:
        #                                                 if w["name"] == weapon["name"]:
        #                                                     character_weapons.remove(weapon)
        #                                             available_weapons = []
        #                                             for w in list(dict_weapons.values()):
        #                                                 if not w["two_hand"]:
        #                                                     available_weapons.append(w)
        #                                             hands = 1
        #                                         break
        #                                     else:
        #                                         print("=" * 4, "Invalid option", "=" * 4, "\n")
        #                                 elif weapon_option == 0:
        #                                     continue
        #             elif opc_menu02 == 2:
        #                 print("=" * 11, "Menu 022 (New Weapon)", "=" * 11, "\n")
        #                 arma = input("Name of the new weapon:\n")
        #                 print("\n")
        #                 while True:
        #                     fuerza = input("Weapon Strength 1-9:\n")
        #                     if not fuerza.isdigit() == True or int(fuerza) < 1 or int(fuerza) > 9:
        #                         print("=" * 4, "Invalid weapon Strength", "=" * 4, "\n")
        #                     else:
        #                         break
        #                 while True:
        #                     velocidad = input("Weapon Speed 1-9:\n")
        #                     if not velocidad.isdigit() == True or int(velocidad) < 1 or int(velocidad) > 9:
        #                         print("=" * 4, "Invalid weapon Speed", "=" * 4, "\n")
        #                     else:
        #                         break
        #                 while True:
        #                     print("Kind of weapon:\n1)One hand\n2)Two hands")
        #                     opc_weapon_kind = input("->Option:\n")
        #                     if not opc_weapon_kind.isdigit() == True or int(opc_weapon_kind) < 1 or int(
        #                             opc_weapon_kind) > 2:  # Este if funciona para verificar si el valor es correcto
        #                         print("=" * 4, "Invalid option", "=" * 4, "\n")
        #                     elif opc_weapon_kind == "1":
        #                         twohands = False
        #                         break
        #                     elif opc_weapon_kind == "2":
        #                         twohands = True
        #                         break
        #                 print("Name: ", arma + "\nStrength: ", fuerza + "\nSpeed: ",
        #                       velocidad + "\nTwo hands type: ", str(twohands))
        #                 save = input("Save this weapon S/N")
        #                 arma_id = 0
        #                 for x in range(1, len(dict_weapons) + 2):
        #                     if x not in dict_weapons:
        #                         arma_id = x
        #
        #                 if save == "S" or "s":
        #                     id = len(dict_weapons) + 1
        #                     print("Saved new weapon with id = ", id)
        #                     print("\n")
        #                     dict_weapons.update({arma_id: {"name": arma, "strength": int(fuerza),
        #                                                    "speed": int(velocidad), "two_hand": twohands}})
        #                     break
        #                 else:
        #                     print("NO añadir lista \n")
        #                     break
        #             elif opc_menu02 == "3":
        #
        #             break




