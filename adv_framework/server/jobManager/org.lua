ADV.GM.Job2 = {}
ADV.GM.Job2.Registered = {
    ["unemployed2"] = {label = "Sans-Emplois", grade = {[0] = {grade = 0, label = " RSA"}}},
    ["vagos"] = {
        label = "Vagos",
        grade = {
            [1] = {
                grade = 1,
                label = "Gang",
            },
            [2] = {
                grade = 2,
                label = "Boss",
                boss = true,
            },
        }
    }

}

function ADV.GM.Job2:GetJobTable(job2)
    if ADV.GM.Job2.Registered[job2] then
        return ADV.GM.Job2.Registered[job2]
    end
end

function ADV.GM.Job2:GetLabelJob(job2)
    if ADV.GM.Job2.Registered[job2] then
        return ADV.GM.Job2.Registered[job2].label
    end
end

function ADV.GM.Job2:GetGradeJob(job2, grade)
    if ADV.GM.Job2.Registered[job2] then
        return ADV.GM.Job2.Registered[job2].grade[grade].grade, ADV.GM.Job2.Registered[job2][grade].label
    end
end

function ADV.GM.Job2:GetSalaryJob(job2, grade)
    if Economie.Job[job2] then
        return Economie.Job[job2][grade]
    end
end

function ADV.GM.Job2:GetIsBoss2(job2, grade)
    if ADV.GM.Job2.Registered[job2] then
        if ADV.GM.Job2.Registered[job2].grade[grade].boss == false or ADV.GM.Job2.Registered[job2].grade[grade].boss == nil then
            return false
        else
            return true
        end
    end
end

