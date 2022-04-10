ADV.GM.Job = {}
ADV.GM.Job.Registered = {
    ["unemployed"] = {label = "Citoyens", grade = {[0] = {grade = 0, label = "RSA"}}},
    ["police"] = {
        label = "LSPD",
        grade = {
            [1] = {
                grade = 1,
                label = "Cadet",
            },
            [2] = {
                grade = 2,
                label = "Cadet",
                boss = true
            },
        }
    },

    ["ems"] = {
        label = "EMS",
        grade = {
            [1] = {
                grade = 1,
                label = "Ambulancier",
            },
            [2] = {
                grade = 2,
                label = "Boss",
                boss = true
            },
        }
    }

}

function ADV.GM.Job:GetJobTable(job)
    if ADV.GM.Job.Registered[job] then
        return ADV.GM.Job.Registered[job]
    end
end

function ADV.GM.Job:GetLabelJob(job)
    if ADV.GM.Job.Registered[job] then
        return ADV.GM.Job.Registered[job].label
    end
end

function ADV.GM.Job:GetGradeJob(job, grade)
    if ADV.GM.Job.Registered[job] then
        return ADV.GM.Job.Registered[job].grade[grade].grade, ADV.GM.Job.Registered[job][grade].label
    end
end

function ADV.GM.Job:GetSalaryJob(job, grade)
    if Economie.Job[job] then
        return Economie.Job[job].salary[grade]
    end
end

function ADV.GM.Job:GetIsBoss(job, grade)
    if ADV.GM.Job.Registered[job] then
        if ADV.GM.Job.Registered[job].grade[grade].boss == false or ADV.GM.Job.Registered[job].grade[grade].boss == nil then
            return false
        else
            return true
        end
    end
end