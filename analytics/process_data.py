import pandas as pd

def doit():
    # Get the database connection string
    from google.cloud import secretmanager
    project_id = 'diet-science-277400'
    secret_id = 'diet-science-db-prod'
    client = secretmanager.SecretManagerServiceClient()
    name = client.secret_version_path(project_id, secret_id, 'latest')
    response = client.access_secret_version(name)
    pg_conn = response.payload.data.decode('UTF-8')


    df = pd.read_sql('SELECT * FROM "EventSamples"', pg_conn)
    df['startDate'] = pd.to_datetime(df['startDate'])
    df['endDate'] = pd.to_datetime(df['endDate'])
    df.index = df['startDate']

    result_df = df.groupby(['category', 'eventId']).resample('h').mean()
    result_df['value'] = result_df['value'].interpolate()

    print(result_df)

    print(f'Writing results to SQL rows={len(result_df)}')
    result_df.to_sql('EventSamplesInterpolated', pg_conn, if_exists='replace', method="multi")
