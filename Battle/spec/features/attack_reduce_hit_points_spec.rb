#'attack Player 2' Scenario 
feature 'Attacking' do
    context 'when the battle of the players commencing' do
        scenario 'attack Player 2' do
            sign_in_and_play
            click_button 'Attack!'
            expect(page).to have_content 'Dave attacked Mittens'
        end

        scenario 'attack Player 1' do
            sign_in_and_play
            click_button 'Attack!'
            click_button 'Attack'
            click_button 'OK'
            click_button 'Attack!'
            expect(page).to have_content 'Mittens attacked Dave'
        end
    end

    context 'when reducing hit points' do
        scenario 'reduce Player 2 HP by 10' do
            sign_in_and_play
            click_button 'Attack!'
            click_button 'OK'
            expect(page).not_to have_content 'Mittens: 60 HP'
            expect(page).to have_content 'Mittens: 50 HP'
        end

        scenario 'reduce Player 1 HP by 10' do
            sign_in_and_play
            click_button 'Attack!'
            click_button 'OK'
            click_button 'Attack!'
            click_button 'OK'
            expect(page).not_to have_content 'Dave: 60 HP'
            expect(page).to have_content 'Dave: 50 HP'
        end
    end
end