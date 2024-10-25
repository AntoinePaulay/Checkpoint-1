!#/bin Bash


# il manque les noms d'utilisateur en argument 
if [ "$#" -ne ]
then
    echo "il manque les noms d'utilisateur en argument"
    exit 1
else
    # test si le l'utilisateur existe
    while [ "$# -ge 0 "]
    do
        if cat /etc/passwd | grep $* /dev/null
        # si existe 
        then 
            echo "l'utilisateur $* existe deja"
            exit 1
        else
        # si existe pas 
      
        # demander la confirmation de la creation du compte 
            read -p "Confirmation de la création du Compte [o/n]" validation
            if [ $validation="o" ]
            then
            # cree l'utilisateur
            sudo useradd $*
                if cat /etc/passwd | grep $* > /dev/null
                then
                    echo "l'utilisateur $* a bien ete crée => oui"
    
                else
                    echo "erreur a la creation de l'utilisateur $*  => non"
                    exit 1
                fi
            fi
        fi
    done
fi
