
continue(){
    echo "###############################"
    echo "#CONTINUING DOWNLOAD FROM LIST#"
    echo "###############################"

    scriptdllist="./continuefile"
    while IFS= read -r link
    do
        wget -c "${link}"
        #echo "${link}"
        echo "${link}" >> done.log
        sed -i '1d' continuefile
        clear

    done <"$scriptdllist"

    echo continuefile >> done.log
    rm continuefile

    echo "###################"
    echo "#finished download#"
    echo "###################"
    exit 0

}

indexWarning(){
    echo "#*******************************************#"
    echo "#Please enter the Code in "" respecting case#"
    echo "#*******************************************#"
}

start(){
    
    echo "#############################################"
    echo "#THE DOWNLOAD WILL BE DONE IN THIS DIRECTORY#"
    echo "#PLEASE PUT THIS SCRIPT INTO AN EMPTY FOLDER#"
    echo "#############################################"

    >done.log

    [ -d lists ] && rm lists
    _pwd="$PWD"    
    mkdir lists
    #devs
    #cp links.tar ./lists/
    cd lists
    #prod 
    wget "https://github.com/idolmatster/dl_tools/releases/download/new/links.tar"
    tar xfv links.tar > log.log
    
    #console selection
    indexWarning
    cat index
    echo ""
    read console
    cd $console
    clear
        
    #set selection
    indexWarning
    cat index
    read list    
    clear
    

    #copy selected list to script dir
    cp $list "${_pwd}"
    cd $_pwd
    mv $list continuefile
    rm lists
    clear
    continue
}

echo "powered by archive org"
cat archive

[ -f continuefile ] && continue
start
