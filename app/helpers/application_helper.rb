module ApplicationHelper
    def p_name_text(e_no, sub_no, p_name)
        e_no_f_no = sprintf("%d",e_no)
        if sub_no > 0 then
            e_no_f_no += ", " + sprintf("%d", sub_no)
        end
        e_no_text = "(" + e_no_f_no + ")"
        if p_name then
            p_name.name.html_safe + e_no_text
        else
            e_no_text
        end
    end

    def character_link(e_no, sub_no)
        file_name = sprintf("%d",e_no)
        if sub_no > 0 then
            file_name += "_" + sprintf("%d",sub_no)
        end
        link_to " キャラ結果", "http://csyuki.sakura.ne.jp/cgi-bin/prism/result/status"+file_name+".html", :target => "_blank"
    end

    def character_old_link(last_result_no, e_no, sub_no, result_no)
        if result_no < last_result_no
            file_name = sprintf("%d",e_no)
            result_no_text = sprintf("%d",result_no)
            if sub_no > 0 then
                file_name += "_" + sprintf("%d",sub_no)
            end
            link_to " キャラ過去結果", "https://archives.teiki.org/yk/4/turn"+result_no_text+"/status"+file_name+".html", :target => "_blank"
        end
    end

    def battle_link(party_no)
        file_name = sprintf("%d",party_no)
        link_to " 戦闘結果", "http://csyuki.sakura.ne.jp/cgi-bin/prism/result/result"+file_name+".html", :target => "_blank"
    end

    def battle_old_link(last_result_no, party_no, result_no)
        if result_no < last_result_no
            file_name = sprintf("%d",party_no)
            result_no_text = sprintf("%d",result_no)
            link_to " 戦闘過去結果", "https://archives.teiki.org/yk/4/turn"+result_no_text+"/result"+file_name+".html", :target => "_blank"
        end
    end
end
