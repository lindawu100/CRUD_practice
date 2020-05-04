class CandidatesController < ApplicationController
    before_action :find_candidate, only: [:show, :edit, :update, :destroy, :vote]

    def index
        @candidates = Candidate.all
    end
    def new
        @candidate = Candidate.new
    end
    def create
        @candidate = Candidate.new(candidate_params)

        if @candidate.save
            flash[:notice] = "Candidate created!"
            redirect_to '/candidates'
        else
            render :new
        end
    end

    def show
        # @candidate = Candidate.find_by(id: params[:id])
    end

    def edit
        # @candidate = Candidate.find_by(id: params[:id])
    end

    def update
        # @candidate = Candidate.find_by(id: params[:id])

        if @candidate.update(candidate_params)
            redirect_to '/candidates', notice: "Candidate updated!"
        else
            render :edit
        end
    end

    def destroy
        # @candidate = Candidate.find_by(id: params[:id])
        @candidate.destroy
        redirect_to '/candidates', notice: "Candidate deleted!"
    end

    def vote
        # @candidate = Candidate.find_by(id: params[:id])

        # Votelog.create(candidate: @candidate, ip_address: request.remote_ip)
        @candidate.votelogs.create(ip_address: request.remote_ip)
       
        # @candidate.increment(:votes)
        redirect_to '/candidates', notice: "Voted!"
    end

    private
    def candidate_params
        params.require(:candidate).permit(:name, :party, :age, :politice)
    end
    def find_candidate
        @candidate = Candidate.find_by(id: params[:id])
    end
end
