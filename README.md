
<a href="https://hits.seeyoufarm.com"><img src="https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2FAdemoDEV%2Fademo_framework&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=false"/></a>

<a href="https://hits.seeyoufarm.com"><img src="https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2FAdemoDEV%2Fademo_framework&count_bg=%23FD0000&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=false"/></a>

# 🪓 Gamemode pour Fivem (Loin d'étre finit) 

# 📌 Requirements

- [oxmysql](https://github.com/overextended/oxmysql/)

```
✔️ Oxmysql est une alternative aux ressources mysql-async/ghmattimysql non maintenues, utilisant node-mysql2 plutôt que mysqljs .
```

# 📝 Install

- Installer le framework et glissé-le dans le dossier ```ressources```
- Installer oxmysql et glissé-le dans le dossier ```ressources```
- Insérer le sql en ```Base de donnée```
- Tout ce qui est à start est à mettre dans le ```server.cfg```

```
ensure oxmysql
ensure adv_framework
```

- Liaison à la Base de donnée

```
set mysql_connection_string "mysql://root@localhost/adv?charset=utf8mb4"
```

# 📍 Inclus

  - Videos: https://streamable.com/kx5yty
  - Hud (Design pas ouf juste pour le repére)
  - Tout Systéme est Synchro au client
  - Pour voir l'inventaire ```/info```
  
 ```GESTION JOUEUR```
 
 - Création Joueur en ```BDD```
 - Joueur stocké dans le cache ```dynamique``` à la connexions et retirer à la deconnexions
 - Systéme d'argent
 - Systéme d'add tout type d'argent (money,dirty,bank)
 - Systéme de remove tout type d'argent (money,dirty,bank)
 - Spawn derniére positions

 ```GESTION INVENTAIRE```
 
 - Systéme de poids
 - Systéme d'item
 - Systéme d'add item
 - Systéme de remove item

 ```GESTION JOB```
 
 - Systéme de Job et Org
 - Systéme de setjob et setorg
    
 
 ```SECURITER```
 
 - Systéme de Token
 - Systéme d'event pour éviter que les cheateurs déclanche des events non-autorisé
 - Pour Crée un Event :

```
  ADV.GM.RegisterEvent("nom_event", function(source, token)
      local source = source -- Récupérer l'id source
      if ADV.GM.CheckToken(source, token) then
          local playercache = ADV.GM:GetPlayer(source) -- Récupérer le joueur du cache dynamique
      end
  end)
```
 - Pour Déclancher du client au server :
 
 ```
    local token = nil

    Citizen.CreateThread(function()
        TriggerEvent("ademo_core:TokenRecup", function(toekn) -- Event client pour récupérer le token du client
            token = toekn
        end)
    end)

    ADV.GM.Event("nom_event", token)
 ```
 
# 🔓 Commande Inclus
  
  - Add Item
  
  ``` /additem id item count```
  
  - Remove Item
 
  ``` /rmvitem id item count```
  
  - Add Money

  ``` /addmoney id type count```
  
  - Remove Money
  
  ``` /rmvmoney id type count```
  
  # 🩸 IMPORTANT
  
 **Je ne recommande pas ce framework au débutant . Pour continuer ce framework il est néccéssaire d'avoir des connaissances en programation .J'ai arrété de codé ce framework parce que j'avais plus trop le temps de codé sur fivem. Pour toute aide je vous invite à rejoindre le discord:**
 
  # 📈 Support
  
  - [Discord](https://discord.gg/5tb5uPa8TF)
 
 
 
   

   
  

    
    
    

