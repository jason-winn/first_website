package com.shell.data
{
    import com.indusblue.utils.*;

    public class Constants extends Object
    {
        public static const MONCTON:Object = {label:"Moncton", instanceName:"moncton", index:25};
        public static const SINGAPORE:Object = {label:Language.setText("Singapore", "Singapour"), instanceName:"singapore", index:14, properFrench:"de Singapour"};
        public static const HALIFAX:Object = {label:"Halifax", instanceName:"halifax", index:27};
        public static const TROIS_RIVIERE:Object = {label:"Trois-Rivières", instanceName:"troisRiviere", index:20};
        public static const RED_DEER:Object = {label:"Red Deer", instanceName:"redDeer", index:6};
        public static const IQALUIT:Object = {label:"Iqaluit", instanceName:"iqaluit", index:32};
        public static const CAPE_BRETON:Object = {label:Language.setText("Cape Breton", " Île du Cap-Breton"), instanceName:"capeBreton", index:26};
        public static const WINNIPEG:Object = {label:"Winnipeg", instanceName:"winnipeg", index:11};
        public static const QUEBEC:String = Language.setText("Quebec", "Québec");
        public static const PANAMA:Object = {label:"Panama", instanceName:"panama", index:1, properFrench:"du Panama"};
        public static const EDMONTON:Object = {label:"Edmonton", instanceName:"edmonton", index:4};
        public static const CAIRO:Object = {label:Language.setText("Cairo", "Le Caire"), instanceName:"cairo", index:6, properFrench:"du Caire"};
        public static const SYDNEY:Object = {label:"Sydney", instanceName:"sydney", index:16, properFrench:"de Sydney"};
        public static const PRINCE_ALBERT:Object = {label:"Prince Albert", instanceName:"princeAlbert", index:10};
        public static const BANGKOK:Object = {label:"Bangkok", instanceName:"bangkok", index:12, properFrench:"de Bangkok"};
        public static const REFERER_INFO_URL:String = "http://idb005.fatboxes.com/app/postcard/";
        public static const ATHENS:Object = {label:Language.setText("Athens", "Athènes"), instanceName:"athens", index:4, properFrench:"d\'Athènes"};
        public static const VANCOUVER:Object = {label:"Vancouver", instanceName:"vancouver", index:0};
        public static const CONTEST_FORM_URL:String = "http://idb005.fatboxes.com/app/contest/submit/";
        public static const BALI:Object = {label:"Bali", instanceName:"bali", index:13, properFrench:"de Bali"};
        public static const NEW_BRUNSWICK:String = Language.setText("New Brunswick", "Nouveau-Brunswick");
        public static const TOKYO:Object = {label:"Tokyo", instanceName:"tokyo", index:15, properFrench:"de Tokyo"};
        public static const LEARN_MORE_LINK:String = Language.setText("http://www.shell.ca/home/content/can-en/products_services/on_the_road/card_services/cards/", "http://www.shell.ca/home/content/can-fr/products_services/on_the_road/card_services/cards/");
        public static const NEW_FOUNDLAND:String = Language.setText("Newfoundland and Labrador", "Terre-Neuve-et-Labrador");
        public static const CALGARY:Object = {label:"Calgary", instanceName:"calgary", index:5};
        public static const TORONTO:Object = {label:"Toronto", instanceName:"toronto", index:13};
        public static const LOCATE_A_SHELL_LINK:String = Language.setText("http://www.shell.com/home/page/can-en/products_services/on_the_road/shell_station_locator/app_station_locator.html", "http://www.shell.ca/home/page/can-fr/products_services/on_the_road/shell_station_locator/app_station_locator.html");
        public static const OTTAWA:Object = {label:"Ottawa", instanceName:"ottawa", index:14};
        public static const SASKATCHEWAN:String = Language.setText("Saskatchewan", "Saskatchewan");
        public static const CHARLOTTETOWN:Object = {label:"Charlottetown", instanceName:"charlottetown", index:21};
        public static const WHITEHORSE:Object = {label:"Whitehorse", instanceName:"whitehorse", index:30};
        public static const distanceArray:Array = [["4,342km", "6,022km", "11,299km ", "7,645km", "9,807km", "9,017km", "10,862km", "16,440km", "8,644km", "7,646km", "11,149km", "17,659km", "18,619km", "21,486km", "19,826km", "19,200km", "26,130km", "25,757km", "14,088km", "28,044km"], ["4,291km", "5,986km", "11,224km", "7,731km", "9,863km", "9,071km", "10,921km ", "16,468km ", "8,735km", "7,729km", "11,199km", "17,738km", "18,697km", "21,565km", "19,907km", "19,278km", "26,210km", "25,836km", "14,167km", "28,122km"], ["4,616km", "5,847km", "11,124km", "7,461km", "9,591km", "8,781km", "10,659km", "16,159km", "8,494km", "7,500km", "11,123km", "17,425km", "18,385km", "21,254km", "19,594km", "18,966km", "25,896km", "25,522km", "13,855km", "27,810km"], ["4,671km", "6,294km", "11,588km", "7,163km", "9,296km", "8,533km", "10,341km", "16,253km", "8,141km", "7,129km", "10,632km", "17,266km", "18,227km", "21,094km", "19,435km", "18,808km", "25,739km", "25,364km", "13,696km", "27,652km"], ["5,169km", "5,806km", "11,119km", "6,907km", "9,033km", "8,211km", "10,109km", "15,677km", "7,967km", "6,989km", "10,814km", "16,846km", "17,805km", "20,673km", "19,014km", "18,387km", "25,316km", "24,943km", "13,274km", "27,230km"], ["5,016km", "5,642km", "10,946km", "7,163km", "9,286km", "8,450km", "10,367km", "15,760km", "8,235km", "7,261km", "11,077km", "17,053km", "18,015km", "20,881km", "19,223km", "18,595km", "25,526km", "25,150km", "13,484km", "27,440km"], ["5,089km", "5,719km", "11,029km", "7,040km", "9,164km", "8,334km", "10,243km", "15,722km", "8,106km", "7,130km", "10,951km", "16,954km", "17,911km", "20,780km", "19,121km ", "18,493km", "25,423km", "25,050km", "13,380km", "27,973km"], ["5,627km", "5,159km", "10,501km", "6,878km", "8,973km", "8,081km", "10,077km", "15,103km", "8,027km", "7,097km", "11,232km", "16,571km", "17,531km", "20,397km", "18,739km", "18,112km", "26,002km", "25,309km", "12,999km", "27,570km"], ["5,544km", "5,396km", "10,735km", "6,804km", "8,915km", "8,045km", "10,012km", "15,271km", "7,929km", "6,982km", "11,038km", "16,576km", "17,535km", "20,405km", "18,745km", "18,746km", "25,048km", "25,048km", "13,007km", "26,963km"], ["5,563km", "5,191km", "10,535km", "6,920km", "9,020km", "8,132km", "10,122km", "15,195km", "8,604km", "7,129km", "11,236km", "16,627km", "17,588km", "20,454km", "18,796km", "18,168km", "25,098km", "24,724km", "13,056km", "27,013km"], ["5,639km", "5,453km", "10,792km", "6,671km", "8,783km", "7,916km", "9,879km", "15,202km", "7,794km", "6,847km", "10,923km", "16,460km", "17,421km", "20,287km", "18,628km", "18,002km", "24,932km", "24,558km", "12,889km", "26,845km"], ["6,135km", "4,833km", "10,153km", "6,613km", "8,670km", "7,742km", "9,785km", "14,597km", "7,814km", "6,930km", "11,278km", "16,155km", "17,120km", "19,982km", "18,324km", "17,695km", "24,626km", "24,252km", "12,584km", "26,539km"], ["5,936km", "4,922km", "10,255km", "6,739km", "8,810km", "7,893km", "9,922km", "14,792km", "7,923km", "7,022km", "11,292km", "16,331km", "17,296km", "20,159km", "18,501km", "17,873km", "24,803km", "24,430km ", "12,760km", "26,716km"], ["7,491km", "3,855km", "8,970km", "6,258km", "8,105km", "7,088km", "9,218km", "13,116km", "7,564km", "6,858km", "11,642km", "15,278km", "16,237km", "19,104km", "17,444km", "16,820km", "23,748km", "23,372km", "11,705km", "25,664km"], ["7,748km", "4,068km", "9,078km", "5,913km", "7,754km", "6,737km", "8,866km", "12,920km", "7,224km", "6,534km", "11,349km", "14,930km", "15,889km", "18,757km", "17,098km", "16,472km", "23,401km", "23,026.km", "11,359km", "25,317km"], ["7,327km", "4,127km", "9,308km", "6,112km", "8,019km", "7,018km", "9,136km", "13,344km", "7,405km", "6,660km", "11,390km", "15,262km", "16,222km", "19,089km", "17,429km", "16,803km", "23,733km", "23,357km", "11,690km", "25,646km"], ["6,696km", "4,477km", "9,736km", "6,732km", "8,367km", "7,470km", "9,487km", "14,000km", "7,623km", "6,801km", "11,355km", "15,733km", "16,690km", "19,560km", "17,900km", "17,274km", "24,203km", "23,829km", "12,162km", "26,117km"], ["7,219km", "3,720km", "8,922km", "6,565km", "8,430km", "7,415km", "9,544km", "13,336km", "7,867km", "7,141km", "11,883km", "15,607km", "16,570km", "19,435km", "17,774km", "17,149km", "24,079km", "23,705km", "12,036km", "25,994km"], ["7,905km", "4,103km", "9,053km", "5,789km", "7,612km", "6,591km", "8,723km", "12,777km", "7,104km", "6,431km", "11,268km", "14,775km", "15,734km", "18,602km", "16,944km", "16,316km", "23,245km", "22,872km", "11,204km", "25,161km"], ["8,056km", "4,277km", "9,153km", "5,558km", "7,380km", "6,361km", "8,492km", "12,667km", "6,875km", "6,210km", "11,060km", "14,552km", "15,516km", "18,379km", "16,719km", "16,093km", "23,023km", "22,648km", "10,981km", "24,937km"], ["7,969km", "4,206km", "9,123km", "5,666km", "7,490km", "6,473km", "8,604km", "12,737km", "6,981km", "6,309km", "11,151km", "14,662km", "15,625km", "18,490km", "16,831km", "16,204km", "23,134km", "22,762km", "11,092km", "25,048km"], ["8,672km", "4,425km", "9,012km", "5,137km", "6,864km", "5,833km", "7,968km", "12,087km", "6,465km", "5,880km", "10,794km", "13,978km", "14,941km", "17,802km", "16,145km", "15,517km", "22,447km", "22,073km", "10,404km", "24,360km"], ["8,617km", "4,419km", "9,033km", "5,165km", "6,903km", "5,831km", "7,966km", "12,140km", "6,492km", "5,899km", "10,809km", "14,020km", "14,982km", "17,847km", "16,186km", "15,561km", "22,491km", "22,116km", "10,448km", "24,404km"], ["8,422km", "4,290km", "9,007km", "5,361km", "7,119km", "6,091km", "8,226km", "12,308km", "6,686km", "6,072km", "10,968km", "14,246km", "15,207km", "18,074km", "16,414km", "15,787km", "22,718km", "22,342km", "10,676km", "24,633km"], ["8,485km", "4,235km", "8,926km", "5,380km", "7,117km", "6,085km", "8,221km", "12,234km", "6,707km", "6,106km", "11,009km", "14,225km", "15,185km", "18,052km", "16,393km", "15,768km", "22,696km", "22,321km", "10,653km", "24,612km"], ["8,556km", "4,358km", "9,006km", "5,243km", "6,984km", "5,954km", "8,089km", "12,189km", "6,570km", "5,971km", "10,878km", "14,101km", "15,064km", "17,929km", "16,270km", "15,643km", "22,574km", "22,200km", "10,531km", "24,487km"], ["8,837km", "4,507km", "9,144km", "5,003km", "6,706km", "5,672km", "7,807km", "11,937km", "6,332km", "5,768km", "10,692km", "13,806km", "14,765km", "17,632km", "15,972km", "15,348km", "22,276km", "21,901km", "10,234km", "24,191km"], ["8,693km", "4,251km", "8,838km", "5,281km", "6,977km", "5,939km", "8,074km", "12,029km", "6,610km", "6,041km", "10,960km", "14,057km", "15,016km", "17,884km", "16,223km", "15,597km", "22,529km", "22,152km", "10,486km", "24,443km"], ["8,935km", "4,876km", "9,301km", "4,646km", "6,386km", "5,359km", "7,494km", "11,911km", "5,974km", "5,399km", "10,322km", "13,533km", "14,496km", "17,362km", "15,703km", "15,074km", "22,004km", "21,631km", "9,962km", "23,921km"], ["9,353km", "4,976km", "9,164km", "4,427km", "6,080km", "5,042km", "7,177km", "11,503km", "5,757km", "5,251km", "10,188km", "13,167km", "14,129km", "16,996km", "15,336km", "14,708km", "21,639km", "21,265km", "9,598km", "23,551km"], ["4,734km", "7,325km", "12,663km", "9,774km", "9,292km", "8,240km", "9,856km", "16,498km", "7,596km", "6,546km", "9,666km", "17,176km", "18,137km", "21,003km", "19,345km", "18,716km", "25,648km", "25,273km", "13,606km", "27,562km"], ["5,632km", "6,577km", "11,900km", "6,107km", "8,244km", "7,494km", "9,292km", "15,480km", "7,093km", "6,085km", "9,844km", "16,270km", "17,230km", "20,097km", "18,437km", "17,811km", "24,740km", "24,367km", "12,699km", "26,655km"], ["7,868km", "6,154km", "10,986km", "4,320km", "6,392km", "5,503km", "7,504km", "13,219km", "5,530km", "4,684km", "9,323km", "14,081km", "15,043km", "17,909km", "16,249km", "15,622km", "22,553km", "22,179km", "10,510km", "24,467km"], ["8,038km", "4,113km", "9,011km", "5,703km", "7,506km", "6,482km", "8,614km", "12,649km", "7,022km", "6,366km", "11,222km", "14,654km", "15,613km", "18,480km", "16,820km", "16,193km", "23,124km", "22,750km", "11,081km", "25,038km"], ["5,044km", "5,477km", "10,807km", "7,264km", "9,386km", "8,532km", "10,474km", "15,719km", "8,358km", "7,387km", "11,260km", "17,084km", "18,046km", "20,912km", "19,253km", "18,625km", "25,556km", "25,183km", "13,514km", "27,470km"]];
        public static const NORTHWEST_TERRITORIES:String = Language.setText("Northwest Territories", "Territoires du Nord-Ouest ");
        public static const WINDSOR:Object = {label:"Windsor", instanceName:"windsor", index:17};
        public static const SAINT_PETERSBURG:Object = {label:Language.setText("St. Petersburg", "Saint-Petersbourg"), instanceName:"saintPetersburg", index:9, properFrench:"de Saint-Petersbourg"};
        public static const LETHBRIDGE:Object = {label:"Lethbridge", instanceName:"lethbridge", index:34};
        public static const BUENOS_AIRES:Object = {label:"Bueno Aires", instanceName:"buenosAires", index:2, properFrench:"de Bueno Aires"};
        public static const NUNAVUT:String = Language.setText("Nunavut", "Nunavut");
        public static const NOVA_SCOTIA:String = Language.setText("Nova Scotia", "Nouvelle-Écosse");
        public static const FREDERICTON:Object = {label:"Fredericton", instanceName:"fredericton", index:23};
        public static const CAPE_TOWN:Object = {label:Language.setText("Cape Town", "Le Cap"), instanceName:"capeTown", index:7, properFrench:"du Cap"};
        public static const BRANDON:Object = {label:"Brandon", instanceName:"brandon", index:12};
        public static const QUEBEC_CITY:Object = {label:Language.setText("Quebec City", "Québec"), instanceName:"quebecCity", index:19};
        public static const MONTREAL:Object = {label:Language.setText("Montreal", "Montréal"), instanceName:"montreal", index:18};
        public static const KIEV:Object = {label:"Kiev", instanceName:"kiev", index:8, properFrench:"de Kiev"};
        public static const YELLOWKNIFE:Object = {label:"Yellowknife", instanceName:"yellowknife", index:31};
        public static const PRINCE_GEORGE:Object = {label:"Prince George", instanceName:"princeGeorge", index:3};
        public static const AUCKLAND:Object = {label:"Auckland", instanceName:"auckland", index:19, properFrench:"d\'Auckland"};
        public static const VICTORIA:Object = {label:"Victoria", instanceName:"victoria", index:1};
        public static const ROME:Object = {label:"Rome", instanceName:"rome", index:5, properFrench:"de Rome"};
        public static const BRITISH_COLUMBIA:String = Language.setText("British Columbia", "Colombie-Britannique");
        public static const SAINT_JOHNS:Object = {label:"St. John\'s", instanceName:"saintJohns", index:29};
        public static const NEW_DELHI:Object = {label:"New Delhi", instanceName:"newDelhi", index:10, properFrench:"de New Delhi"};
        public static const CORNER_BROOK:Object = {label:"Corner Brook", instanceName:"cornerBrook", index:28};
        public static const SUMMERSIDE:Object = {label:"Summerside", instanceName:"summerside", index:22};
        public static const APPLY_NOW_LINK:String = Language.setText("https://www4.bmo.com/cartesdecredit/splash/union/0,2273,35649_87559004,00.html", "https://www4.bmo.com/cartesdecredit/splash/union/0,2273,35702_87558992,00.html");
        public static const BEIJING:Object = {label:"Beijing", instanceName:"beijing", index:11, properFrench:"de Beijing"};
        public static const MELBOURNE:Object = {label:"Melbourne", instanceName:"melbourne", index:17, properFrench:"de Melbourne"};
        public static const COPENHAGEN:Object = {label:Language.setText("Copenhagen", "Copenhague"), instanceName:"copenhagen", index:3, properFrench:"de Copenhague"};
        public static const MOOSE_JAW:Object = {label:"Moose Jaw", instanceName:"mooseJaw", index:9};
        public static const POSTCARD_SEND_URL:String = "http://idb005.fatboxes.com/app/postcard/submit/";
        public static const REGINA:Object = {label:"Regina", instanceName:"regina", index:7};
        public static const MANITOBA:String = Language.setText("Manitoba", "Manitoba");
        public static const SHERBROOKE:Object = {label:"Sherbrooke", instanceName:"sherbrooke", index:33};
        public static const KELOWNA:Object = {label:"Kelowna", instanceName:"kelowna", index:2};
        public static const YUKON:String = Language.setText("Yukon", "Yukon");
        public static const SAINT_JOHN:Object = {label:"Saint John", instanceName:"saintJohn", index:24};
        public static const ALBERTA:String = Language.setText("Alberta", "Alberta");
        public static const DUBAI:Object = {label:"Dubai", instanceName:"dubai", index:18, properFrench:"de Dubai"};
        public static const HONOLULU:Object = {label:"Honolulu", instanceName:"honolulu", index:0, properFrench:"de Honolulu"};
        public static const ONTARIO:String = Language.setText("Ontario", "Ontario");
        public static const PEI:String = Language.setText("Prince Edward Island", "Ile-du-Prince-Édouard");
        public static const SASKATOON:Object = {label:"Saskatoon", instanceName:"saskatoon", index:8};
        public static const SUDBURY:Object = {label:"Sudbury", instanceName:"sudbury", index:15};
        public static const THUNDER_BAY:Object = {label:"Thunder Bay", instanceName:"thunderBay", index:16};

        public function Constants()
        {
            return;
        }// end function

    }
}
