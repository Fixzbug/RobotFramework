import pandas
import json
import pandas as pd


def checking_type_read_excel_by_sheet(filepath, sheet_name, col):
    excel_data_df = pandas.read_excel(
        open(filepath, 'rb'), sheet_name=sheet_name)

    # Apply the strip method to each cell to remove leading and trailing spaces
    excel_data_df = excel_data_df.apply(lambda col: col.map(
        lambda x: x.strip() if isinstance(x, str) else x))

    # Convert the cleaned DataFrame to JSON
    json_str = excel_data_df.to_json(orient='records')
    json_obj = json.loads(json_str)

    # Get index row
    row_count = len(excel_data_df.index)

    # print(json_obj,row_count)
    # return json_obj,row_count

    # for i in range(row_count):
    #     if json_obj[i][col] == None: # '' 'None'
    #         print(i,json_obj[i][col],type(json_obj[i][col]))
    #     else:
    #         print(i,json_obj[i][col],type(json_obj[i][col]))

    for i in range(row_count):
        print("INDEX_>: ", i, "DATA: ", json_obj[i][col])

    for i in range(row_count):
        print("CHECKING: ", col, " INDEX: ", i, "DATA: ",
              json_obj[i][col], " TYPE: ", type(json_obj[i][col]))


if __name__ == "__main__":

    while True:
        title = str(input("INPUT TITLE TYPE : "))

        checking_type_read_excel_by_sheet(
            "D:/automate/Excel_sync_robot_file/Auto_reject.xlsx", "USER", title)
