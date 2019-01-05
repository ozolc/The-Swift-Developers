//
//  Data.swift
//  11_UITabBarController
//
//  Created by Maksim Nosov on 22/07/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit

class Data: UIViewController {
    
    static let apostlesImages = [#imageLiteral(resourceName: "01_Andrew"), #imageLiteral(resourceName: "02_Peter"), #imageLiteral(resourceName: "03_John"), #imageLiteral(resourceName: "04_James"), #imageLiteral(resourceName: "05_Philip"), #imageLiteral(resourceName: "06_Bartholomew"), #imageLiteral(resourceName: "07_Matthew"), #imageLiteral(resourceName: "08_Thomas"), #imageLiteral(resourceName: "09_James"), #imageLiteral(resourceName: "10_Jude"), #imageLiteral(resourceName: "11_Simon"), #imageLiteral(resourceName: "12_Judas_Iscariot")]
    
    static let apostlesTitles = ["Андрей Первозванный",
                                 "Апостол Пётр",
                                 "Иоанн Богослов",
                                 "Иаков Зеведеев",
                                 "Апостол Филипп",
                                 "Апостол Варфоломей",
                                 "Левий Матфей",
                                 "Апостол Фома",
                                 "Иаков Алфеев",
                                 "Апостол Фаддей",
                                 "Симон Кананит",
                                 "Иуда Искариот"]
    
    static let apostlesArray = [andrewDescription, peterDescription, johnDescription, jamesDescription, philipDescription, bartholomewDescription, matthewDescription, thomasDescription, jamesAlphaeusDescription, judeDescription, simonDescription, judasIscariotDescription]
    
    static let aboutDescription = """
    Двена́дцать апо́столов (греч. απόστολος — «посол, посланник») — ближайшие ученики Иисуса Христа (их не следует путать с апостолами от семидесяти).

    Согласно евангельскому повествованию[1], во время Своей земной жизни Иисус Христос выбрал 12 ближайших учеников, которые и называются апостолами от двенадцати. Сведения о жизни апостолов известны из Евангелия и Деяний святых апостолов (Деяния), которые входят в Новозаветный канон, а также из Священного Предания.
    """
}
let andrewDescription = "Апо́стол Андре́й (греч. Ανδρέας , лат. Andreas, ивр. ‏אנדראס הקדוש‏‎), больше известный как апостол Андре́й Первозва́нный — один из двенадцати апостолов, учеников Иисуса Христа; первым, согласно Евангелию от Иоанна, был призван Иисусом Христом, поэтому назван Первозванным. В списках апостолов, приводимых в Евангелиях от Матфея и Луки, занимает второе место после своего брата, апостола Петра, но в Евангелии от Марка — четвёртое место. Персонаж книг Нового Завета."

let peterDescription = "Апо́стол Пётр (греч. Απόστολος Πέτρος; умер около 67 года в Риме) в христианстве — один из двенадцати апостолов (ближайших учеников) Иисуса Христа. Вместе с апостолом Павлом называется первоверховным апостолом. В Католической церкви считается первым папой римским."

let johnDescription = "Иоа́нн Богосло́в, Иоа́нн Зеведе́ев (др.-евр. יוחנן «Йоханан», койне Ἰωάννης) — один из Двенадцати апостолов, единственный из них, умерший естественной смертью. Сын Зеведея (др.-евр. יוֹחנן בן זבדי, Йоханан Бен-Заведи), также прозванный Богословом, евангелист, брат Апостола Иакова. В Евангелии от Марка вместе с братом прозван Иисусом «Сыном грома» (Воанергес) (3:17)."

let jamesDescription = "Иаков Зеведеев (греч. Ιάκωβος, лат. Iacobus, исп. Santiago), Иаков (Яков; Жак) Старший — один из двенадцати апостолов, ближайших учеников Иисуса Христа; единственный апостол, чья смерть описана в Новом Завете. Сын Зеведея (ивр. ‏יעקב בן זבדי‏‎, Яаков Бен-Заведи), родился в Галилее; старший брат Иоанна Богослова. Был убит в 44 году в Иерусалиме. В испанской традиции именуется Сантьяго (святой Яго) и «мавроборец»."

let philipDescription = "Фили́пп из Вифсаиды (ивр. ‏פיליפ מבית צידה‏‎, Филип Ми Бейт-Цаеда, греч. Φίλιππος) — один из двенадцати апостолов (учеников) Иисуса Христа. Упомянут в списках апостолов в Евангелии от Матфея (10:3), от Марка (3:18), от Луки (6:14), а также в Деяниях Апостолов (1:13)."

let bartholomewDescription = "Варфоломе́й (Нафанаи́л) (арам. בר-תולמי, греч. Βαρθολομαίος, лат. Bartholomaeus) — один из двенадцати апостолов (учеников) Иисуса Христа, упомянут в Новом Завете.     Художественно изображается в светлой одежде с золотым рисунком и ножом в руке, символом его мученичества: с него содрали кожу."

let matthewDescription = "Леви́й Матфе́й (ивр. ‏מַתִּתְיָהוּ‏‎ Mattithyahu или ивр. ‏מתי‏‎ Mattay, «Дар Яхве»; греч. Ματθαῖος Matthaios; также Святой Матфей; Евангелист Матфей; Левий Алфеев) — один из двенадцати апостолов, ближайших учеников Иисуса Христа, персонаж Нового Завета. Считается автором первого канонического Евангелия — Евангелия от Матфея. Художественно-символически изображается в сопровождении ангела."

let thomasDescription = "Фома́ (ивр. ‏תומא יהודה‏‎, Тома Йегу́да, греч. Θωμάς, лат. Thomas), иначе называемый Близнец, — один из двенадцати апостолов (учеников) Иисуса Христа. Известный фразеологизм «Фома неверующий» (или «Фома неверный»), который употребляют для именования человека, которого сложно в чем-либо убедить, связан с одним из эпизодов Евангелия от Иоанна: апостол Фома не смог поверить в Воскресение Христово до тех пор, пока своими глазами не увидел Христа воскресшим."

let jamesAlphaeusDescription = "Иа́ков Алфе́ев, сын Алфея (ивр. ‏יעקב בן-חלפַי‏‎, Йааков Бен Халфай) — один из двенадцати апостолов Иисуса Христа. Брат апостола Иуды Иаковлева, возможно брат апостола и Евангелиста Матфея. В трёх Евангелиях его имя приводится в списке двенадцати (Мф. 10:3; Мк. 3:18; Лк. 6:15), однако других сведений о нём не сообщается. Согласно житию, Иаков был мытарем, проповедовал в Иудее, а затем вместе с апостолом Андреем отправился в Эдессу. После самостоятельно вёл проповедь в Газе и Елевферополе (Южная Палестина)."

let judeDescription = "Иу́да Фадде́й (ивр. ‏יהודה בן יעקב‏‎, Йеѓуда Бен-Йааков, греч. Ιούδας Θαδδαῖος, лат. Judas Thaddeus; Иуда Иаковлев или Леввей, Lebbaeus) — согласно Библии — один из 12 апостолов, брат Иакова Алфеева, сын Алфея или Клеопы."

let simonDescription = "Си́мон Канани́т (Зилот) (греч. Σίμων ο Κανανίτης, др.-евр. שמעון הקנאי, Шимон ха-Канаи) — один из 12 ближайших апостолов (учеников) Иисуса Христа. Память апостола Симона совершается в Православной церкви 10 (23) мая по юлианскому календарю и в Собор двенадцати апостолов 30 июня (13 июля), в Католической церкви 28 октября."

let judasIscariotDescription = "Иу́да Искарио́т (Иуда Искариотский; ивр. ‏יהודה איש קריות‏‎, ʾîš-qərijjôt; Иуда сын Симона) — в христианстве один из двенадцати апостолов, учеников Иисуса Христа; единственный выходец из провинции Иудея среди апостолов, остальные были галилеяне. Согласно Евангелию от Иоанна, был казначеем их общины: ему был вверен ящик, в который опускались приношения. Пользуясь должностью, Иуда подворовывал. На последней трапезе Иисус ему подал, обмакнув, кусок хлеба и «сказал ему: что делаешь, делай скорее». После чего Иуда вышел и предал его, выдав первосвященникам за 30 сребреников. Загадка его перехода от апостольства к предательству — сюжет многочисленных богословских и художественных произведений."



