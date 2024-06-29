print('''
*******************************************************************************
         You Tarzan, me Jane.
                             /

                       ____~                 ____
                      ///( _\              (((.  \
                      )))` '\              */* )  )
                     (((  -_(              \7_(   \
                    ___/  /___  ,____      ( _\\  _\_
                   /`    ~   ,\/-__/        (   \( ` \
                  /  / . _\_.\/ |         __|(. (._\_ \
                 / _/'    (  /  |        /`___)  / ____)
                 \  | \    \( `-'       /\/  % ,/\/%
                  \ |  %%%   %              %%%%%%%%
                _ /_/ /  `%%%%)            %%%%%%%%%
                 ///  )    %%%|            %%%%%%%%
                     %\    %% |            %%%%%%%
                       \   |  |            ( (  (
                        )` )` )             \ \` \
                       /  (  (               \ \  )
                       \  /  /                \ \ |
                        )( )(_                 \ \|
                       / |/____\--       --   __))\___
                 -----/-_) b'ger       ------'---''---'
*******************************************************************************
''')
print("Welcome to Help Tarzan Find Jane: The Game!")
print("Your mission is to do exactly that: to help Tarzan find Jane throughout the twists and turns of the jungle.") 


choice1 = input('You\'ve come across two vines that lead to different paths. Which vine do you choose to swing across? Type "left" or "right" \n').lower()
if choice1 == "left":
  choice2 = input('Now, you\'ve come to a lake. Do you want to swim across it or catch a boat ride? Type "wait" to wait for a boat. Type "swim" to swim across. \n').lower()
  if choice2 == "wait":
    choice3 = input("You safely make it to the other side of the water and spot a treehouse with 3 color coded pathways leading up to the front door. One red, one yellow and one blue. Which color path do you choose? \n").lower()
    if choice3 == "red":
      print("There's an angry cheetah on the other side of this path. Game Over.")
    elif choice3 == "yellow":
      print("You found Jane! You Win!")
    elif choice3 == "blue":
      print("You found Terk instead. Game Over.")
    else:
      print("You chose the wrong color. Game Over.")
  else:
    print("You got distracted by Terk and forgot to find Jane. Game Over.")
else:
  print("You ran into Clayton. Game Over.")
