class Api::V1::MatchesController < ApplicationController
    def index
        matches_player = Match.where(winner_id: params[:player_id].to_i)
        render json: matches_player
    end

    def show
        matches_by_faction = Match.where('winner_id IN (?) AND winner_faction = ? OR  loser_faction = ?', params[:player_id].to_i, params[:id], params[:id])
        wins = 0
        matches_by_faction.each do |match|
          if match.winner_faction == params[:id]
            wins += 1
          end
        end
        percentage_victory = wins * 100 / matches_by_faction.length
        loss = matches_by_faction.length - wins
        render json: {matches_by_faction: matches_by_faction ,wins: wins, loss: loss, percentage_victory: percentage_victory}
    end
end
