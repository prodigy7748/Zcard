class BoardsController < ApplicationController
    before_action :find_board, only: [:show, :edit, :update, :destroy]

    def index
        @boards = Board.all
    end

    def new
        @board = Board.new #(title : "hello")
    end

    def show
        @posts = @board.posts.order(id: :desc)
    end

    def edit
    end

    def update
        if  @board.update(board_params)
            redirect_to root_path, notice: '更新成功'
        else
            render :edit
        end
    end

    def destroy
        @board.destroy
        redirect_to root_path, notice: '看板刪除'
    end

    def create
        # params = { "board" => {'title' => '...'}} ===> params['board']['title']
        @board = Board.new(board_params)
        
        if @board.save
            # flash["notice"] = "成功新增看板"
            redirect_to "/", notice: '成功新增看板'
        else
            render :new
        end
    end

    private
    def find_board
        @board = Board.find(params[:id])
    end

    def board_params
        params.require(:board).permit(:title)
    end
end
