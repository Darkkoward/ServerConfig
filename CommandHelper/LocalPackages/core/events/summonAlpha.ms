bind('player_chat', null, null, @e) {

    @pworld = pworld()

    if(@pworld != "alpha"){
        die()
    }

    @ploc = ploc()
    @msg = @e['message']
    @player = player()

    if(integer(@ploc['x']) == -1408 && integer(@ploc['y']) == 12 && integer(@ploc['z']) == 1792){
        if(@msg == "pneumonoultramicroscopicsilicovolcanoconiosis"){

            if(phas_item(352) < 1 || phas_item(441) < 1 || phas_item(260) < 1){
               die()
            }
            set_timeout(2000,closure(
                runas(~console,'/sudo God_Doesnt_Exist c:Greetings, mortal.')
                set_block_at(-1408,40,1807,152,'alpha')
                set_timeout(50,closure(
                    set_block_at(-1408,40,1807,0,'alpha')
                ))
        
                try(
                    @eventID = associative_array('id': @player.'summonstuck')
                    @filter = associative_array('player': @player)
                    @bindID = bind(player_move, @eventID, @filter, @event, @player,
                        runas(~console,'/sudo God_Doesnt_Exist c:Farewell, mortal.')
                        unbind()
                    )
                    export(@player.'summonstuck',@bindID)
                ,
                    broadcast('BIND FAILED')
                )
            ))
        }
    }

    if(@player == "God_Doesnt_Exist"){
         if(@msg == "Farewell, mortal."){
            set_block_at(-1409,40,1807,152,'alpha')
            set_timeout(50,closure(
                set_block_at(-1409,40,1807,0,'alpha')
            ))
            @plrs = all_players('alpha')
            set_timeout(1000,closure(
                foreach(@plr in @plrs){
                    if(@plr != 'God_Doesnt_Exist'){
                        runas(~console,'/minecraft:clear '.@plr)
                        @bindID = import(@plr.'summonstuck')
                        try(
                            unbind(@bindID)
                        ,
                        )
                        runas(~console,"/warp city ".@plr)
                    }
                }    
            ))
        }

    }
}
