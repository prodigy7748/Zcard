class BoardsController < ApplicationController
    def index
    end

    def new
        @board = Board.new #(title : "hello")
    end

    def create
        # params = { "board" => {'title' => '...'}} ===> params['board']['title']
        clean_params = params.require(:board).permit(:title)
        @board = Board.new(clean_params)
        
        if @board.save
            # flash["notice"] = "成功新增看板"
            redirect_to "/", notice: '成功新增看板'
        else
            render :new
        end
    end
end
